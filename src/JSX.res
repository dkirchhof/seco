type element = Jsx.element
type component<'props> = Jsx.component<'props>

external float: float => element = "%identity"
external int: int => element = "%identity"
external string: string => element = "%identity"
external array: array<element> => element = "%identity"

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

  external someElement: element => option<element> = "%identity"
}
