type rec t<'props> =
  | Async('props => promise<Jsx.element>)
  | Fragment
