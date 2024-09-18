type props = {
  ...JsxDOM.domProps,
  class?: string,
}

type propsAndChildren<'props> = {
  props: 'props,
  children: array<Node.t<'props>>,
}

let rec mapChildren = (children, result) => {
  switch (children: Children.t) {
  | String(s) => Array.push(result, Node.TextNode({text: s}))
  | Number(n) => Array.push(result, Node.TextNode({text: Float.toString(n)}))
  | Array(a) => Array.forEach(a, i => mapChildren(i, result))
  | Object(o) => Array.push(result, Obj.magic(o))
  }
}

let handleProps = props => {
  let props = Obj.magic(props)

  let children = []

  props->Dict.get("children")->Option.forEach(c => mapChildren(c, children))

  Dict.set(props, "children", children)
}

let createElement = (component: Element.t<'props>, props: 'props) => {
  handleProps(props)

  switch component {
  | Async(async) =>
    Node.Component({
      tag: async,
      props,
    })->Node.toElement
  | Fragment =>
    Node.Fragment({
      props: props,
    })->Node.toElement
  }
}

let createTag = (tag: string, props: props): Jsx.element => {
  handleProps(props)

  Node.Tag({
    tag,
    props,
  })->Node.toElement
}

type fragmentProps = {children: Jsx.element}

let fragment: Element.t<fragmentProps> = {
  Element.Fragment
}
