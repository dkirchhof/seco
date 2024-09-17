type rec componentNode<'props> = {
  tag: 'props => promise<Jsx.element>,
  props: 'props,
}

and fragmentNode<'props> = {
  props: 'props,
}

and tagNode<'props> = {
  tag: string,
  props: 'props,
}

and textNode = {text: string}

and t<'props> =
  | Component(componentNode<'props>)
  | Fragment(fragmentNode<'props>)
  | Tag(tagNode<'props>)
  | TextNode(textNode)

external toElement: t<_> => Jsx.element = "%identity"
