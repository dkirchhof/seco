type props = {text: string}

@jsx.componentWithProps
let make = props => {
  <p class="block text"> {Jsx.string(props.text)} </p>
}
