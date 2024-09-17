type props = {pathname: string}

let make = ComponentP.make(async props => {
  <Page pathname=props.pathname title="Ipsum" style=Assets.Ipsum.style script=Assets.Ipsum.script>
    <h1> {JSX.string("Ipsum")} </h1>
  </Page>
})
