type props = {
  pathname: string,
  id: string,
}

let make = ComponentP.make(async props => {
  let post = await API.getPost(props.id)

  switch post {
  | Some(post) =>
    <Page filename=RescriptBun.Global.filename pathname=props.pathname title=post.title>
      <h1 style={Obj.magic(`view-transition-name: title-${post.id};`)}>
        {JSX.string(post.title)}
      </h1>
      <img
        class="headerImage"
        src=post.image
        style={Obj.magic(`view-transition-name: image-${post.id};`)}
      />
      <div class="date" style={Obj.magic(`view-transition-name: date-${post.id};`)}>
        {post.date->Date.fromString->Date.toLocaleDateString->JSX.string}
      </div>
      <div style={Obj.magic(`view-transition-name: firstParagraph-${post.id};`)}>
        <Text text=post.firstParagraph />
      </div>
      {post.content
      ->Array.map(block => {
        switch block {
        | Headline(level, text) => <Headline level text />
        | Text(text) => <Text text />
        | Quote({quote, quotee}) => <Quote quote quotee />
        | Separator => <Separator />
        | Accordeon(items) => <Accordeon items />
        }
      })
      ->Jsx.array}
    </Page>
  | None => raise(Not_found)
  }
})
