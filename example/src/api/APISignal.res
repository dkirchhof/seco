type state<'a> = Init | Loading | Success('a) | Error(string)

let make = (fetcher: 'a => promise<'b>, onChange) => {
  let signal: Signal.t<state<'b>> = Signal.make(Init, onChange)

  let fetch = params => {
    // Signal.setValue(signal, Loading)

    let _ =
      fetcher(params)
      ->Promise.thenResolve(result => {
        Signal.setValue(signal, Success(Obj.magic(result)))
      })
      ->Promise.catch(_ => {
        Signal.setValue(signal, Error("Error while fetching data"))

        Promise.resolve()
      })
  }

  let reset = () => Signal.setValue(signal, Init)

  (fetch, reset)
}
