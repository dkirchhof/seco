WebComponent.define({
  name: "x-counter",
  connect: (self) => {
    let counter = DOMUtils.querySelector(self, ".counter")->Option.getUnsafe
    let button = DOMUtils.querySelector(self, "button")->Option.getUnsafe

    let count = counter->DOMUtils.getText->Int.fromString->Option.getOr(0)->ref

    DOMUtils.addEventListener(button, "click", _ => {
      count.contents = count.contents + 1

      DOMUtils.setText(counter, Int.toString(count.contents))
    })
  },
})
