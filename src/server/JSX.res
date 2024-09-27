external float: float => Jsx.element = "%identity"
external int: int => Jsx.element = "%identity"
external string: string => Jsx.element = "%identity"
external array: array<Jsx.element> => Jsx.element = "%identity"

let jsx = JSX_Impl.createElement
let jsxs = JSX_Impl.createElement
let jsxFragment = JSX_Impl.fragment

module Elements = {
  type props = DOM.props

  let jsx = JSX_Impl.createTag
  let jsxs = JSX_Impl.createTag

  external someElement: Jsx.element => option<Jsx.element> = "%identity"
}
