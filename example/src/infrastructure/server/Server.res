open RescriptBun
open RescriptBun.Globals

@get external url: Bun.Server.t => string = "url"

// helpers
let fileResponse = async path => {
  Bun.file(`./public/${path->List.toArray->Array.join("/")}`)->Response.makeFromFile
}

let notFoundResponse = async (url: Url.t) => {
  let html = await Renderer.render(<NotFound_Page pathname=url.pathname />, false)
  let headers = HeadersInit.FromArray([("content-type", "text/html")])

  Response.make(html, ~options={headers, status: 404})
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

// use cases
let getPost = GetPost.make(InMemoryDB.getPost)
let getPosts = GetPosts.make(InMemoryDB.getPosts)
let findPosts = FindPosts.make(InMemoryDB.findPosts)

let server = Bun.serve({
  port: 3000,
  fetch: (req, _server) => {
    let url = req->Request.url->Url.make

    let path =
      String.split(url.pathname, "/")
      ->Array.filter(s => String.length(s) > 0)
      ->List.fromArray

    try {
      switch path {
      | list{"api", "findPosts"} =>
        let query = url.searchParams.get("q")->Null.getOr("")
        findPosts({query: query})->Promise.then(jsonResponse)
      | list{"public", ...rest} => fileResponse(rest)
      | list{} => htmlResponse(<Home_Page pathname=url.pathname />)
      | list{"blog"} => htmlResponse(<Blog_Page getPosts pathname=url.pathname />)
      | list{"blog", "posts", id} => htmlResponse(<Post_Page getPost pathname=url.pathname id />)
      | list{"lorem"} => htmlResponse(<Lorem_Page pathname=url.pathname />)
      | list{"ipsum"} => htmlResponse(<Ipsum_Page pathname=url.pathname />)
      | _ => raise(Not_found)
      }
    } catch {
    | Not_found => notFoundResponse(url)
    }
  },
})

Console.log(`Listening on ${url(server)}`)
