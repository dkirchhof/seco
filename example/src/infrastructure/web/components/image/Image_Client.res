WebComponent.define({
  name: "x-image",
  connect: () => {
    let body = DOMUtils.body
    let image = DOMUtils.querySelector("img")->Option.getExn
    let dialog = DOMUtils.querySelector("dialog")->Option.getExn
    let backdrop = DOMUtils.querySelector(".backdrop")->Option.getExn
    let dialogImage = DOMUtils.querySelector("dialog > img")->Option.getExn

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
