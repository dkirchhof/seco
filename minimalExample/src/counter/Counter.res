type props = {initialValue: int}

let make = ComponentP.make(async props => {
  <x-counter>
    <div class="counter"> {JSX.int(props.initialValue)} </div>
    <button> {JSX.string("click me")} </button>
  </x-counter>
})
