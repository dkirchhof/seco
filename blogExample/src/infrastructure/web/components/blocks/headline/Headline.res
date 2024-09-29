type props = {level: Post.headlineLevel, text: string}

let make = ComponentP.make(async props => {
  switch props.level {
  | H2 => <h2 class="block headline"> {Jsx.string(props.text)} </h2>
  | H3 => <h3 class="block headline"> {Jsx.string(props.text)} </h3>
  | H4 => <h4 class="block headline"> {Jsx.string(props.text)} </h4>
  | H5 => <h5 class="block headline"> {Jsx.string(props.text)} </h5>
  | H6 => <h6 class="block headline"> {Jsx.string(props.text)} </h6>
  }
})
