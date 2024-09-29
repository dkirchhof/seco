let make = Component.make(async _ => {
  <Page filename=RescriptBun.Global.filename title="Ipsum">
    <h1> {JSX.string("Ipsum")} </h1>
  </Page>
})

let toResponse = () => ResponseUtils.htmlResponse(make, {})
