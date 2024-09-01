type props = {title: string, children: Jsx.element}

let make = Component.make(async (props: props) => {
  <html lang="en">
    <head>
      <title />
      // <meta charset="UTF-8">
      // <meta name="viewport" content="width=device-width, initial-scale=1">

      // <script src="/bundle.mjs" type="module"></script>
    </head>
    <body>
      // <h1> {JSX.string(props.title)} </h1>
      // <Counter initialValue={10} />
      {props.children}
    </body>
  </html>
})
