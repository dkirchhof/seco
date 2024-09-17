WebComponent.define({
  name: "x-slider",
  connect: () => {
    let prevButton = DOMUtils.querySelector(".prevButton")->Option.getExn
    let nextButton = DOMUtils.querySelector(".nextButton")->Option.getExn
    let slides = DOMUtils.querySelector(".slides")->Option.getExn

    DOMUtils.addEventListener(prevButton, "click", _ => {
      DOMUtils.scrollBy(slides, -100, 0)
    })

    DOMUtils.addEventListener(nextButton, "click", _ => {
      DOMUtils.scrollBy(slides, 100, 0)
    })
  },
})
