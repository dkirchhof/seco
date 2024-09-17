type props = {quote: string, quotee: string}

let make = ComponentP.make(async props => {
  <blockquote class="block quote">
    <p> {Jsx.string(props.quote)} </p>
    <cite> {Jsx.string(props.quotee)} </cite>
  </blockquote>
})
