// open RescriptBun
// open RescriptBun.Globals

// @get external url: Bun.Server.t => string = "url"

// let server = Bun.serve({
//   port: 3000,
//   fetch: async (_req, _server) => {
//     // let url = req->Request.url->Url.make
//     // let path = url.pathname

//     // if String.startsWith(path, "/admin") {
//     //   Bun.file("./public/index.html")->Response.makeFromFile
//     // } else if String.startsWith(path, "/bundle.mjs") {
//     //   Bun.file("./public/bundle.mjs")->Response.makeFromFile
//     // } else if String.startsWith(path, "/api") {
//     //   Response.make("OK")
//     // } else {
//     //   Response.make("Page not found", ~options={status: 404})
//     // }

//     let html = await (<App title="hello world" />).toString()

//     Response.make(
//       Obj.magic(html),
//       ~options={headers: HeadersInit.FromArray([("content-type", "text/html")])},
//     )
//   },
// })

// Console.log(`Listening on ${url(server)}`)

let log = any => RescriptBun.Bun.inspect(any, ~options={colors: true, depth: 10.0})->Console.log

Console.log("########################")

log(
  <App title="hello world">
    <button> {JSX.string("click me")} </button>
  </App>,
)

log(
  await Renderer.render(
    <App title="hello world">
      <button> {JSX.string("click me")} </button>
    </App>,
  ),
)
