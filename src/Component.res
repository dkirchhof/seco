let make = (render: 'props => promise<Jsx.element>): ('props => Jsx.element) => {
  render->Obj.magic
}
