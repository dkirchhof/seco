let dialogOpen = ref(false)

WebComponent.define({
  name: "search-panel",
  connect: () => {
    let openButton = DOMUtils.querySelector("button")->Option.getExn
    let dialog = DOMUtils.querySelector("dialog")->Option.getExn
    let input = DOMUtils.querySelector("input")->Option.getExn
    let list = DOMUtils.querySelector("ul")->Option.getExn

    let (findPosts, resetPosts) = APISignal.make(
      query => ClientAPI.findPosts(query),
      v => {
        switch v {
        | Init => DOMUtils.setInnerHTML(list, "Search for posts")
        | Loading => DOMUtils.setInnerHTML(list, "Searching...")
        | Success(posts) =>
          let _ = DOMUtils.startViewTransition(document, () => {
            let html = switch Array.length(posts) {
            | 0 => "Nothing found"
            | _ =>
              posts
              ->Array.map(post => `<li><a href="/blog/posts/${post.id}">${post.title}</a></li>`)
              ->Array.join("")
            }

            DOMUtils.setInnerHTML(list, html)
          })
        | Error(message) => DOMUtils.setInnerHTML(list, message)
        }
      },
    )

    let openDialog = () => {
      DOMUtils.setValue(input, "")

      resetPosts()

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

    DOMUtils.addEventListener(openButton, "click", _ => {
      openDialog()
    })

    DOMUtils.addEventListener(DOMUtils.document, "keydown", e => {
      let key = JsxEvent.Keyboard.key(e)

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

    DOMUtils.addEventListener(input, "input", _ => {
      let query = DOMUtils.getValue(input)

      findPosts(query)
    })
  },
})
