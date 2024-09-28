type props = {pathname: string}

let make = ComponentP.make(async props => {
  <Page filename=RescriptBun.Global.filename pathname=props.pathname title="404">
    <h1 class="center"> {JSX.string("404")} </h1>
  </Page>
})
