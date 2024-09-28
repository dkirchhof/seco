type componentNode<'props> = {
  tag: 'props => promise<Jsx.element>,
  props: 'props,
}

type fragmentNode<'props> = {
  props: 'props,
}

type tagNode<'props> = {
  tag: string,
  props: 'props,
}

type textNode = {text: string}

type t<'props> =
  | Component(componentNode<'props>)
  | Fragment(fragmentNode<'props>)
  | Tag(tagNode<'props>)
  | TextNode(textNode)

external toElement: t<_> => Jsx.element = "%identity"
