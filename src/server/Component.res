type noProps = {}

let make = (render: unit => promise<Jsx.element>): Element.t<noProps> => {
  Element.Async(Obj.magic(render))
}
