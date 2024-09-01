type rec componentNode<'props> = {
  tag: 'props => promise<Jsx.element>,
  props: 'props,
  children: array<t<'props>>,
}

and tagNode<'props> = {tag: string, props: 'props, children: array<t<'props>>}

and textNode = {text: string}

and t<'props> =
  | Component(componentNode<'props>)
  | Tag(tagNode<'props>)
  | TextNode(textNode)
