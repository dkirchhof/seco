let dialogOpen = ref(false)

WebComponent.define({
  name: "search-panel",
  connect: () => {
    let dialog = DOMUtils.querySelector("dialog")->Option.getExn
    let input = DOMUtils.querySelector("input")->Option.getExn

    let openDialog = () => {
      DOMUtils.setValue(input, "")

      let _ = DOMUtils.startViewTransition(document, () => {
        DOMUtils.showModal(dialog)

        dialogOpen := true
      })
    }

    let closeDialog = () => {
      let _ = DOMUtils.startViewTransition(document, () => {
        DOMUtils.close(dialog)

        dialogOpen := false
      })
    }

    DOMUtils.addEventListener(DOMUtils.document, "keydown", e => {
      let key = JsxEvent.Keyboard.key(e)
      let ctrl = JsxEvent.Keyboard.ctrlKey(e)
      let cmd = JsxEvent.Keyboard.metaKey(e)

      if key === "k" && (ctrl || cmd) {
        openDialog()
      }

      if key === "Escape" && dialogOpen.contents {
        JsxEvent.Keyboard.preventDefault(e)

        closeDialog()
      }
    })

    DOMUtils.addEventListener(dialog, "click", e => {
      let target = JsxEvent.Mouse.target(e)->Obj.magic

      if target === dialog {
        closeDialog()
      }
    })
  },
})
