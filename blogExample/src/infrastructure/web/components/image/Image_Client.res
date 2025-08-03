WebComponent.define({
  name: "x-image",
  connect: self => {
    let body = DOMUtils.body
    let image = DOMUtils.querySelector(self, "img")->Option.getOrThrow
    let dialog = DOMUtils.querySelector(self, "dialog")->Option.getOrThrow
    let backdrop = DOMUtils.querySelector(self, ".backdrop")->Option.getOrThrow
    let dialogImage = DOMUtils.querySelector(self, "dialog > img")->Option.getOrThrow

    DOMUtils.addEventListener(image, "click", _ => {
      DOMUtils.setStyle(body, "overflow", "hidden")
      DOMUtils.setStyle(image, "view-transition-name", "dialog-image")

      let transition = DOMUtils.startViewTransition(document, () => {
        DOMUtils.setStyle(image, "view-transition-name", "none")
        DOMUtils.setStyle(dialogImage, "view-transition-name", "dialog-image")
        DOMUtils.show(dialog)
      })

      let _ = transition.finished->Promise.thenResolve(_ => {
        DOMUtils.setStyle(dialogImage, "view-transition-name", "none")
      })
    })

    DOMUtils.addEventListener(backdrop, "click", _ => {
      DOMUtils.setStyle(dialogImage, "view-transition-name", "dialog-image")

      let transition = DOMUtils.startViewTransition(document, () => {
        DOMUtils.setStyle(image, "view-transition-name", "dialog-image")
        DOMUtils.setStyle(dialogImage, "view-transition-name", "none")
        DOMUtils.close(dialog)
      })

      let _ = transition.finished->Promise.thenResolve(_ => {
        DOMUtils.setStyle(image, "view-transition-name", "none")
        DOMUtils.setStyle(body, "overflow", "auto")
      })
    })
  },
})
