module Link = {
  type props = {
    name: string,
    pathname: string,
    currentPathname: string,
  }

  let make = ComponentP.make(async props => {
    <a
      href=props.pathname ariaCurrent={props.pathname === props.currentPathname ? #page : #"false"}>
      {Jsx.string(props.name)}
    </a>
  })
}

type props = {
  filename: string,
  title: string,
  children: Jsx.element,
}

let make = ComponentP.make(async props => {
  let assets = Dict.get(Assets.assets, props.filename)
  let script = Option.flatMap(assets, a => a.script)->Option.getOr("")
  let style = Option.flatMap(assets, a => a.style)->Option.getOr("")

  let url = Context.getRequest()->RescriptBun.Globals.Request.url->RescriptBun.Url.make

  <>
    {Jsx.string("<!DOCTYPE html>")}
    <html lang="en">
      <head>
        <title> {JSX.string(props.title)} </title>
        <meta charSet="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href={style} />
        <script src={script} defer=true />
      </head>
      <body>
        <header>
          <nav>
            <Link name="DK" pathname="/" currentPathname=url.pathname />
            <Link name="Blog" pathname="/blog" currentPathname=url.pathname />
            <Link name="Lorem" pathname="/lorem" currentPathname=url.pathname />
            <Link name="Ipsum" pathname="/ipsum" currentPathname=url.pathname />
          </nav>
          <SearchPanel />
        </header>
        <main>
          <div> props.children </div>
        </main>
        <footer />
      </body>
    </html>
  </>
})
