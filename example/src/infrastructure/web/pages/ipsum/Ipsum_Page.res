type props = {pathname: string}

let make = ComponentP.make(async props => {
  <Page filename=RescriptBun.Global.filename pathname=props.pathname title="Ipsum">
    <h1> {JSX.string("Ipsum")} </h1>
  </Page>
})
