type props = {posts: array<Post.t>}

let make = ComponentP.make(async props => {
  <Page filename=RescriptBun.Global.filename title="Blog">
    <h1> {JSX.string("This is a Blog")} </h1>
    <div class="posts">
      {props.posts
      ->Array.mapWithIndex((post, i) => {
        <PostPreview post variant={i === 0 ? Big : Small} />
      })
      ->JSX.array}
    </div>
  </Page>
})

let toResponse = posts => ResponseUtils.htmlResponse(make, {posts: posts})
