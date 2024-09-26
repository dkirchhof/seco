type variant = Big | Small

type props = {post: Post.t, variant: variant}

let make = ComponentP.make(async props => {
  let class = `postPreview ${(props.variant :> string)}`

  <article class>
    <a href={`/blog/posts/${props.post.id}`}>
      <img
        src=props.post.image
        loading=#"lazy"
        style={Obj.magic(`view-transition-name: image-${props.post.id};`)}
      />
      <div>
        <div class="date" style={Obj.magic(`view-transition-name: date-${props.post.id};`)}>
          {props.post.date->Date.fromString->Date.toLocaleDateString->JSX.string}
        </div>
        <h2 style={Obj.magic(`view-transition-name: title-${props.post.id};`)}>
          {props.post.title->JSX.string}
        </h2>
        <p style={Obj.magic(`view-transition-name: firstParagraph-${props.post.id};`)}>
          {props.post.firstParagraph->JSX.string}
        </p>
      </div>
    </a>
  </article>
})
