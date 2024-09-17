type props = {
  pathname: string,
  id: string,
}

let make = ComponentP.make(async props => {
  let post = await API.getPost(props.id)

  switch post {
  | Some(post) =>
    <Page
      pathname=props.pathname title=post.title style=Assets.Post.style script=Assets.Post.script>
      <h1> {JSX.string(post.title)} </h1>
      <img class="headerImage" src=post.image />
      <div class="date"> {post.date->Date.fromString->Date.toLocaleDateString->JSX.string} </div>
      <Text text=post.firstParagraph />
      <Gallery
        images=[
          "https://fastly.picsum.photos/id/629/640/360.jpg?hmac=Eni5bZnhpD8vForbGbAqveaMXCQVaXqTR4P9_1_iLXw",
          "https://fastly.picsum.photos/id/675/640/360.jpg?hmac=2MM1FICbL3kNVU6QW8I6auu35cwpUrK_x_Mr9YKZ9_I",
          "https://fastly.picsum.photos/id/75/640/360.jpg?hmac=wP_Hwbwux2jb2DhSaBsgCdBYTCAtDV58fuU8szRUQew",
          "https://fastly.picsum.photos/id/186/640/360.jpg?hmac=l3VrnwhvnGZc0uyO7YsHj2kcWDaPkYWQ36RqhmuDNCM",
        ]
      />
      {post.content
      ->Array.map(block => {
        switch block {
        | Text(text) => <Text text />
        | Quote({quote, quotee}) => <Quote quote quotee />
        | Separator => <Separator />
        }
      })
      ->Jsx.array}
    </Page>
  | None =>
    <Page pathname=props.pathname title="404" style=Assets.Post.style script=Assets.Post.script>
      <h1> {JSX.string("404")} </h1>
    </Page>
  }
})
