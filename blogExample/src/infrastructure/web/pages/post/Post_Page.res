type props = {
  getPost: GetPost.t,
  id: string,
}

@jsx.componentWithProps
let make = async props => {
  let post = await props.getPost({id: props.id})

  switch post {
  | Some(post) =>
    <Page filename=RescriptBun.Global.filename title=post.title>
      <h1 style={`view-transition-name: title-${post.id};`}> {JSX.string(post.title)} </h1>
      <img class="headerImage" src=post.image style={`view-transition-name: image-${post.id};`} />
      <div class="date" style={`view-transition-name: date-${post.id};`}>
        {post.date->Date.fromString->Date.toLocaleDateString->JSX.string}
      </div>
      <div style={`view-transition-name: firstParagraph-${post.id};`}>
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
  | None => throw(Not_found)
  }
}
