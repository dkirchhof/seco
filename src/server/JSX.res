external float: float => Jsx.element = "%identity"
external int: int => Jsx.element = "%identity"
external string: string => Jsx.element = "%identity"
external array: array<Jsx.element> => Jsx.element = "%identity"

let jsx = JSX_Impl.renderReactorComponent
let jsxs = JSX_Impl.renderReactorComponent
let jsxFragment = JSX_Impl.fragment

let renderArray = (arr, mapper) => {
  arr->Array.map(mapper)->array
}

module Elements = {
  type props = {
    ...JsxDOM.domProps,
    class?: string,
  }

  let jsx = JSX_Impl.renderTag
  let jsxs = JSX_Impl.renderTag

  external someElement: Jsx.element => option<Jsx.element> = "%identity"
}
