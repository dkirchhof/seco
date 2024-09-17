type props = {images: array<string>}

let make = ComponentP.make(async props => {
  <x-gallery> {props.images->Array.map(image => <Image image />)->Obj.magic->Jsx.array} </x-gallery>
})
