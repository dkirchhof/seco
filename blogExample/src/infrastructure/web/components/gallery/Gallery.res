type props = {images: array<string>}

@jsx.componentWithProps
let make = props => {
  <x-gallery> {props.images->Array.map(image => <Image image />)->Jsx.array} </x-gallery>
}
