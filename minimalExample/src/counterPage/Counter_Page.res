let make = Component.make(async _props => {
  let filename = RescriptBun.Global.filename

  let assets = Dict.get(Assets.assets, filename)
  let script = Option.flatMap(assets, a => a.script)->Option.getOr("")
  let style = Option.flatMap(assets, a => a.style)->Option.getOr("")

  <>
    {Jsx.string("<!DOCTYPE html>")}
    <html lang="en">
      <head>
        <title> {Jsx.string("Seco - Counter Example")} </title>
        <meta charSet="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href={style} />
        <script src={script} defer=true />
      </head>
      <body>
        <h1> {Jsx.string("Seco - Counter Example")} </h1>
        <Counter initialValue=0 />
        <Counter initialValue=10 />
      </body>
    </html>
  </>
})
