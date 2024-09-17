open RescriptBun
open RescriptBun.Globals

@get external url: Bun.Server.t => string = "url"

let x = [1, 2, 3, 4, 5]

let server = Bun.serve({
  port: 3000,
  fetch: async (req, _server) => {
    let url = req->Request.url->Url.make

    let path =
      String.split(url.pathname, "/")
      ->Array.filter(s => String.length(s) > 0)
      ->List.fromArray

    switch path {
    | list{"public", ...rest} =>
      Bun.file(`./example/public/${rest->List.toArray->Array.join("/")}`)->Response.makeFromFile
    | list{} =>
      let html = await Renderer.render(<Home_Page pathname=url.pathname />, false)
      let headers = HeadersInit.FromArray([("content-type", "text/html")])

      Response.make(html, ~options={headers: headers})
    | list{"blog"} =>
      let html = await Renderer.render(<Blog_Page pathname=url.pathname />, false)
      let headers = HeadersInit.FromArray([("content-type", "text/html")])

      Response.make(html, ~options={headers: headers})
    | list{"blog", "posts", id} =>
      let html = await Renderer.render(<Post_Page pathname=url.pathname id />, false)
      let headers = HeadersInit.FromArray([("content-type", "text/html")])

      Response.make(html, ~options={headers: headers})
    | list{"lorem"} =>
      let html = await Renderer.render(<Lorem_Page pathname=url.pathname />, false)
      let headers = HeadersInit.FromArray([("content-type", "text/html")])

      Response.make(html, ~options={headers: headers})
    | list{"ipsum"} =>
      let html = await Renderer.render(<Ipsum_Page pathname=url.pathname />, false)
      let headers = HeadersInit.FromArray([("content-type", "text/html")])

      Response.make(html, ~options={headers: headers})
    | _ => Response.make("not found", ~options={status: 404})
    }
  },
})

Console.log(`Listening on ${url(server)}`)

// let log = any => RescriptBun.Bun.inspect(any, ~options={colors: true, depth: 10.0})->Console.log

// Console.log("########################")

// Console.log(
//   await Renderer.render(
//     <App title="hello world">
//       <button> {JSX.string("click me")} </button>
//     </App>,
//     true,
//   ),
// )

// let routes = Routes.routes

// @module("../../src/build.mts")
// external buildPages: array<string> => unit = "buildPages"

// buildPages(Routes.routes)

// // %%raw(`
// //   import { buildPages } from "../../src/build.mts";

// //   buildPages(routes)
// // `)
