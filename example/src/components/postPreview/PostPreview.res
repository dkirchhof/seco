type variant = Big | Small

type props = {post: Post.t, variant: variant}

let make = ComponentP.make(async props => {
  let class = `postPreview ${(props.variant :> string)}`

  <article class>
    <a href={`/blog/posts/${props.post.id}`}>
      <img src=props.post.image loading=#"lazy" />
      <div>
        <div class="date">
          {props.post.date->Date.fromString->Date.toLocaleDateString->JSX.string}
        </div>
        <h2> {props.post.title->JSX.string} </h2>
        <p> {props.post.firstParagraph->JSX.string} </p>
      </div>
    </a>
  </article>
})
