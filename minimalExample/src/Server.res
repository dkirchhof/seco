module Bun = RescriptBun.Bun

@get external url: RescriptBun.Bun.Server.t => string = "url"

let server = Bun.serve({
  port: 3000,
  fetch: (req, _server) => {
    let url = Request.getUrl(req)
    let path = Url.pathnameToList(url.pathname)

    try {
      switch path {
      | list{"public", ..._} => Response.makeFileResponse(url.pathname)
      | list{} => Response.makeHtmlResponse(<Counter_Page />)
      | _ => throw(Not_found)
      }
    } catch {
    | Not_found => Response.makeNotFoundTextResponse("url not found")
    }
  },
})

Console.log(`Listening on ${url(server)}`)
