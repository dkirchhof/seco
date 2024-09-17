type props = {images: array<string>}

let make = ComponentP.make(async props => {
  <x-slider>
    <div class="controls">
      <button class="prevButton"> {Jsx.string("⬅")} </button>
      <button class="nextButton"> {Jsx.string("➡")} </button>
    </div>
    <div class="slides">
      {props.images
      ->Array.map(image =>
        <div class="slide">
          <img src=image loading=#"lazy" />
        </div>
      )
      ->Jsx.array}
    </div>
  </x-slider>
})
