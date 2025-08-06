type props = {getPosts: GetPosts.t}

@jsx.componentWithProps
let make = async props => {
  let posts = await props.getPosts()

  <Page filename=RescriptBun.Global.filename title="Blog">
    <h1> {JSX.string("This is a Blog")} </h1>
    <div class="posts">
      {posts
      ->Array.mapWithIndex((post, i) => {
        <PostPreview post variant={i === 0 ? Big : Small} />
      })
      ->JSX.array}
    </div>
  </Page>
}
