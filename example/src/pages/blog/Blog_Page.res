type props = {pathname: string}

let make = ComponentP.make(async props => {
  let posts = await API.getPosts()

  <Page pathname=props.pathname title="Blog" style=Assets.Blog.style script=Assets.Blog.script>
    <h1> {JSX.string("This is a Blog")} </h1>
    <div class="posts">
      {posts
      ->Array.mapWithIndex((post, i) => {
        <PostPreview post variant={i === 0 ? Big : Small} />
      })
      ->JSX.array}
    </div>
  </Page>
})
