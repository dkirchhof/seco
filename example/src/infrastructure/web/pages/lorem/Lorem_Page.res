let make = Component.make(async _ => {
  <Page filename=RescriptBun.Global.filename title="Lorem">
    <h1> {JSX.string("Lorem")} </h1>
  </Page>
})

let toResponse = () => ResponseUtils.htmlResponse(make, {})
