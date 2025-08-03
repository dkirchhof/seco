WebComponent.define({
  name: "search-panel",
  connect: self => {
    let openButton = DOMUtils.querySelector(self, "button")->Option.getOrThrow
    let dialog = DOMUtils.querySelector(self, "dialog")->Option.getOrThrow
    let input = DOMUtils.querySelector(self, "input")->Option.getOrThrow
    let list = DOMUtils.querySelector(self, "ul")->Option.getOrThrow

    let dialogOpen = ref(false)
    let timeout = ref(None)

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
      switch timeout.contents {
      | Some(timeout) => clearTimeout(timeout)
      | None => ()
      }

      timeout := Some(setTimeout(() => {
            let query = DOMUtils.getValue(input)
            findPosts(query)
          }, 250))
    })
  },
})
