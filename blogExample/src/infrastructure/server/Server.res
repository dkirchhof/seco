open RescriptBun

@get external url: Bun.Server.t => string = "url"

// use cases
let getPost = GetPost.make(InMemoryDB.getPost)
let getPosts = GetPosts.make(InMemoryDB.getPosts)
let findPosts = FindPosts.make(InMemoryDB.findPosts)

let server = Bun.serve({
  port: 3000,
  fetch: (req, _server) => {
    Context.setRequest(req)

    let url = Request.getUrl(req)
    let path = Request.getPath(url)

    try {
      switch path {
      | list{"public", ..._} => Response.makeFileResponse(url.pathname)
      | list{"api", "findPosts"} =>
        let query = url.searchParams.get("q")->Null.getOr("")

        Response.makeJsonResponse(findPosts({query: query}))
      | list{} => Response.makeHtmlResponse(<Home_Page />)
      | list{"blog"} => Response.makeHtmlResponse(<Blog_Page getPosts />)
      | list{"blog", "posts", id} => Response.makeHtmlResponse(<Post_Page getPost id />)
      | list{"lorem"} => Response.makeHtmlResponse(<Lorem_Page />)
      | list{"ipsum"} => Response.makeHtmlResponse(<Ipsum_Page />)
      | _ => raise(Not_found)
      }
    } catch {
    | Not_found => Response.makeNotFoundHtmlResponse(<NotFound_Page />)
    }
  },
})

Console.log(`Listening on ${url(server)}`)
