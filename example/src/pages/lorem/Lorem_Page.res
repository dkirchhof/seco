type props = {pathname: string}

let make = ComponentP.make(async props => {
  <Page pathname=props.pathname title="Lorem" style=Assets.Lorem.style script=Assets.Lorem.script>
    <h1> {JSX.string("Lorem")} </h1>
  </Page>
})
