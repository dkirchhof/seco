type block =
  | Text(string)
  | Quote({quote: string, quotee: string})
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
