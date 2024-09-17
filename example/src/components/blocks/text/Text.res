type props = {text: string}

let make = ComponentP.make(async props => {
  <p class="block text"> {Jsx.string(props.text)} </p>
})
