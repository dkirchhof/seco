type noProps = {}

let make = (render: noProps => promise<Jsx.element>) => {
  Element.Async(render)
}
