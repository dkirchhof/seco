let make = (render: 'props => promise<Jsx.element>) => {
  Element.Async(render)
}
