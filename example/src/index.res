open RescriptBun
open RescriptBun.Globals

@get external url: Bun.Server.t => string = "url"

let fileResponse = async path => {
  Bun.file(`./public/${path->List.toArray->Array.join("/")}`)->Response.makeFromFile
}

let notFoundResponse = async () => {
  Response.make("not found", ~options={status: 404})
}

let jsonResponse = async data => {
  let json = data->JSON.stringifyAny->Option.getExn

  let headers = HeadersInit.FromArray([("content-type", "application/json")])

  Response.make(json, ~options={headers: headers})
}

let htmlResponse = async element => {
  let html = await Renderer.render(element, false)
  let headers = HeadersInit.FromArray([("content-type", "text/html")])

  Response.make(html, ~options={headers: headers})
}

let server = Bun.serve({
  port: 3000,
  fetch: async (req, _server) => {
    let url = req->Request.url->Url.make

    let path =
      String.split(url.pathname, "/")
      ->Array.filter(s => String.length(s) > 0)
      ->List.fromArray

    switch path {
    | list{"api", "findPosts"} =>
      let query = url.searchParams.get("q")->Null.getOr("")
      let posts = await API.findPosts(query)

      await jsonResponse(posts)
    | list{"public", ...rest} => await fileResponse(rest)
    | list{} => await htmlResponse(<Home_Page pathname=url.pathname />)
    | list{"blog"} => await htmlResponse(<Blog_Page pathname=url.pathname />)
    | list{"blog", "posts", id} => await htmlResponse(<Post_Page pathname=url.pathname id />)
    | list{"lorem"} => await htmlResponse(<Lorem_Page pathname=url.pathname />)
    | list{"ipsum"} => await htmlResponse(<Ipsum_Page pathname=url.pathname />)
    | _ => await notFoundResponse()
    }
  },
})

Console.log(`Listening on ${url(server)}`)
