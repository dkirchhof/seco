type state<'a> = Init | Loading | Success('a) | Error(string)

let cancel = ref(None)

let make = (fetcher, onChange) => {
  let signal = Signal.make(Init, onChange)

  let fetch = params => {
    switch cancel.contents {
    | Some(fn) => fn()
    | None => ()
    }

    let cancelled = ref(false)

    cancel :=
      Some(
        () => {
          cancelled := true
        },
      )

    if !cancelled.contents {
      Signal.setValue(signal, Loading)
    }

    let _ =
      fetcher(params)
      ->Promise.thenResolve(result => {
        if !cancelled.contents {
          Signal.setValue(signal, Success(result))
        }
      })
      ->Promise.catch(_ => {
        if !cancelled.contents {
          Signal.setValue(signal, Error("Error while fetching data"))
        }

        Promise.resolve()
      })
  }

  let reset = () => Signal.setValue(signal, Init)

  (fetch, reset)
}
