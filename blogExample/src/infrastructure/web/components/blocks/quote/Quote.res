type props = {quote: string, quotee: string}

@jsx.componentWithProps
let make = props => {
  <blockquote class="block quote">
    <p> {Jsx.string(props.quote)} </p>
    <cite> {Jsx.string(props.quotee)} </cite>
  </blockquote>
}
