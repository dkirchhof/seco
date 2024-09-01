type props = {
  ...JsxDOM.domProps,
  class?: string,
}

type propsAndChildren<'props> = {
  props: 'props,
  children: array<Node.t<'props>>,
}

let rec mapChildren = children => {
  switch (children: Children.t) {
  | String(s) => [Node.TextNode({text: s})]
  | Number(n) => [Node.TextNode({text: Float.toString(n)})]
  | Array(a) => Obj.magic(a) // {
  //   Console.log(a)
  //   Array.flatMap(a, mapChildren)
  // }
  | Object(o) => [Obj.magic(o)]
  }
}

let getPropsAndChildren = props => {
  props: props
  ->Obj.magic
  ->Dict.toArray
  ->Array.filter(((key, _value)) => key !== "children")
  ->Dict.fromArray,
  children: props
  ->Obj.magic
  ->Dict.get("children")
  ->Option.mapOr([], mapChildren),
}

let renderReactorComponent = (component: Jsx.component<'props>, props: 'props): Jsx.element => {
  let propsAndChildren = getPropsAndChildren(props)

  Node.Component({
    tag: Obj.magic(component),
    props: propsAndChildren.props,
    children: propsAndChildren.children,
  })->Obj.magic
}

let renderTag = (tag: string, props: props): Jsx.element => {
  let propsAndChildren = getPropsAndChildren(props)

  Node.Tag({
    tag,
    props: propsAndChildren.props,
    children: propsAndChildren.children,
  })->Obj.magic
}

let fragment = %ffi(`
  function(props) {
    return props.children;
  }
`)
