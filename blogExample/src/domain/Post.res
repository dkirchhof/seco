type headlineLevel = H2 | H3 | H4 | H5 | H6

type block =
  | Headline(headlineLevel, string)
  | Text(string)
  | Quote({quote: string, quotee: string})
  | Accordeon(array<(string, string)>)
  | Separator

type t = {
  id: string,
  slug: string,
  title: string,
  image: string,
  date: string,
  firstParagraph: string,
  content: array<block>,
}

let toJson: t => JSON.t = post => {
  // Dict.fromArray([
  //   ("id", JSON.Encode.string(post.id)),
  //   ("slug", JSON.Encode.string(post.id)),
  //   ("title", JSON.Encode.string(post.id)),
  //   ("image", JSON.Encode.string(post.id)),
  //   ("date", JSON.Encode.string(post.id)),
  //   ("firstParagraph", JSON.Encode.string(post.id)),
  //   ("content", JSON.Encode.string(post.id)),
  // ])

  post->Obj.magic
}
