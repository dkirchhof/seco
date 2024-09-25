type props = {pathname: string}

let make = ComponentP.make(async props => {
  <Page filename=RescriptBun.Global.filename pathname=props.pathname title="Lorem">
    <h1> {JSX.string("Lorem")} </h1>
  </Page>
})
