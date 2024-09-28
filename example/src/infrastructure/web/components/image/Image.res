type props = {
  image: string,
}

let make = ComponentP.make(async props => {
  <x-image>
    <img src=props.image />
    <dialog>
      <div class="backdrop" />
      <img src=props.image />
    </dialog>
  </x-image>
})
