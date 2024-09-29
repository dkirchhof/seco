open RescriptBun
open RescriptBun.Globals

@get external url: Bun.Server.t => string = "url"

// helpers
let fileResponse = async path => {
  Bun.file(`./public/${path->List.toArray->Array.join("/")}`)->Response.makeFromFile
}

let notFoundResponse = async () => {
  let html = await Renderer.render(<NotFound_Page />, false)
  let headers = HeadersInit.FromArray([("content-type", "text/html")])

  Response.make(html, ~options={headers, status: 404})
}

// use cases
let findPosts = FindPosts.make(InMemoryDB.findPosts, ResponseUtils.jsonResponse)

let renderHome = RenderHome.make(Home_Page.toResponse)
let renderPost = RenderPost.make(InMemoryDB.getPost, Post_Page.toResponse)
let renderPosts = RenderPosts.make(InMemoryDB.getPosts, Blog_Page.toResponse)
let renderLorem = RenderLorem.make(Lorem_Page.toResponse)
let renderIpsum = RenderIpsum.make(Ipsum_Page.toResponse)

let server = Bun.serve({
  port: 3000,
  fetch: (req, _server) => {
    Context.setRequest(req)

    let url = req->Request.url->Url.make

    let path =
      String.split(url.pathname, "/")
      ->Array.filter(s => String.length(s) > 0)
      ->List.fromArray

    try {
      switch path {
      | list{"api", "findPosts"} =>
        let query = url.searchParams.get("q")->Null.getOr("")
        findPosts({query: query})
      | list{"public", ...rest} => fileResponse(rest)
      | list{} => renderHome()
      | list{"blog"} => renderPosts()
      | list{"blog", "posts", id} => renderPost({id: id})
      | list{"lorem"} => renderLorem()
      | list{"ipsum"} => renderIpsum()
      | _ => raise(Not_found)
      }
    } catch {
    | Not_found => notFoundResponse()
    }
  },
})

Console.log(`Listening on ${url(server)}`)
