type props = {
  pathname: string,
  id: string,
}

let make = ComponentP.make(async props => {
  let post = await API.getPost(props.id)

  switch post {
  | Some(post) =>
    <Page filename=RescriptBun.Global.filename pathname=props.pathname title=post.title>
      <h1> {JSX.string(post.title)} </h1>
      <img class="headerImage" src=post.image />
      <div class="date"> {post.date->Date.fromString->Date.toLocaleDateString->JSX.string} </div>
      <Text text=post.firstParagraph />
      {post.content
      ->Array.map(block => {
        switch block {
        | Headline(level, text) => <Headline level text />
        | Text(text) => <Text text />
        | Quote({quote, quotee}) => <Quote quote quotee />
        | Separator => <Separator />
        }
      })
      ->Jsx.array}
    </Page>
  | None =>
    <Page filename=RescriptBun.Global.filename pathname=props.pathname title="404">
      <h1> {JSX.string("404")} </h1>
    </Page>
  }
})
