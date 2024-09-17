let make = Component.make(async () => {
  <x-counter>
    <div class="counter"> {JSX.int(0)} </div>
    <button> {JSX.string("click me")} </button>
  </x-counter>
})
