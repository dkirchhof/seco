type headlineLevel = H2 | H3 | H4 | H5 | H6

type block =
  | Headline(headlineLevel, string)
  | Text(string)
  | Quote({quote: string, quotee: string})
  | Accordeon(array<(string, string)>)
  | Separator()

type t = {
  id: string,
  slug: string,
  title: string,
  image: string,
  date: string,
  firstParagraph: string,
  content: array<block>,
}
