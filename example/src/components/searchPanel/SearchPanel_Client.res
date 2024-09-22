let dialogOpen = ref(false)

WebComponent.define({
  name: "search-panel",
  connect: () => {
    let dialog = DOMUtils.querySelector("dialog")->Option.getExn
    let input = DOMUtils.querySelector("input")->Option.getExn
    let list = DOMUtils.querySelector("ul")->Option.getExn

    let (findPosts, resetPosts) = APISignal.make(API.findPosts, v => {
      switch v {
      | Init => DOMUtils.setInnerHTML(list, "Search for posts")
      | Loading => DOMUtils.setInnerHTML(list, "Searching...")
      | Success(posts) =>
        posts
        ->Array.map(post => `<li><a href="/blog/posts/${post.id}">${post.title}</a></li>`)
        ->Array.join("")
        ->(DOMUtils.setInnerHTML(list, _))
      | Error(message) => DOMUtils.setInnerHTML(list, message)
      }
    })

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

    DOMUtils.addEventListener(input, "input", _ => {
      let query = DOMUtils.getValue(input)

      // let _ = API.getPosts()->Promise.thenResolve(posts => {
      //   let html =
      //     posts
      //     ->Array.filter(post => String.includes(post.title, query))
      //     ->Array.map(post => `<li><a href="/blog/posts/${post.id}">${post.title}</a></li>`)
      //     ->Array.join("")

      //   DOMUtils.startViewTransition(
      //     document,
      //     () => {
      //       DOMUtils.setInnerHTML(list, html)
      //     },
      //   )
      // })

      findPosts(query)
    })
  },
})
