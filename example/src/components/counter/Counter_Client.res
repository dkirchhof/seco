WebComponent.define({
  name: "x-counter",
  connect: () => {
    let count = ref(0)
    let counter = DOMUtils.querySelector(".counter")
    let button = DOMUtils.querySelector("button")

    switch (counter, button) {
    | (Some(counter), Some(button)) =>
      DOMUtils.addEventListener(button, "click", _ => {
        count.contents = count.contents + 1

        DOMUtils.setText(counter, Int.toString(count.contents))
      })
    | _ => ()
    }
  },
})
