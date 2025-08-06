type props = {initialValue: int}

@jsx.componentWithProps
let make = props => {
  <x-counter>
    <div class="counter"> {JSX.int(props.initialValue)} </div>
    <button> {JSX.string("click me")} </button>
  </x-counter>
}
