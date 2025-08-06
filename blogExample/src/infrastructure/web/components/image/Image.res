type props = {
  image: string,
}

@jsx.componentWithProps
let make = props => {
  <x-image>
    <img src=props.image />
    <dialog>
      <div class="backdrop" />
      <img src=props.image />
    </dialog>
  </x-image>
}
