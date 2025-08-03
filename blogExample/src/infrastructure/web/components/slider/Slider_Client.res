WebComponent.define({
  name: "x-slider",
  connect: self => {
    let prevButton = DOMUtils.querySelector(self, ".prevButton")->Option.getOrThrow
    let nextButton = DOMUtils.querySelector(self, ".nextButton")->Option.getOrThrow
    let slides = DOMUtils.querySelector(self, ".slides")->Option.getOrThrow

    DOMUtils.addEventListener(prevButton, "click", _ => {
      DOMUtils.scrollBy(slides, -100, 0)
    })

    DOMUtils.addEventListener(nextButton, "click", _ => {
      DOMUtils.scrollBy(slides, 100, 0)
    })
  },
})
