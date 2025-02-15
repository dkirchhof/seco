WebComponent.define({
  name: "x-counter",
  connect: () => {
    let counter = DOMUtils.querySelector(".counter")->Option.getExn
    let button = DOMUtils.querySelector("button")->Option.getExn

    let count = counter->DOMUtils.getText->Int.fromString->Option.getOr(0)->ref

    DOMUtils.addEventListener(button, "click", _ => {
      count.contents = count.contents + 1

      DOMUtils.setText(counter, Int.toString(count.contents))
    })
  },
})
