let makeTextResponse = async text => {
  RescriptBun.Globals.Response.make(text)
}

let makeNotFoundTextResponse = async text => {
  RescriptBun.Globals.Response.make(text, ~options={status: 404})
}

let makeHtmlResponse = async element => {
  let html = await Renderer.render(element)
  let headers = RescriptBun.Globals.HeadersInit.FromArray([("content-type", "text/html")])

  RescriptBun.Globals.Response.make(html, ~options={headers: headers})
}

let makeNotFoundHtmlResponse = async element => {
  let html = await Renderer.render(element)
  let headers = RescriptBun.Globals.HeadersInit.FromArray([("content-type", "text/html")])

  RescriptBun.Globals.Response.make(html, ~options={headers, status: 404})
}

let makeJsonResponse = async json => {
  let jsonString = JSON.stringify(json)
  let headers = RescriptBun.Globals.HeadersInit.FromArray([("content-type", "application/json")])

  RescriptBun.Globals.Response.make(jsonString, ~options={headers: headers})
}

let makeNotFoundJsonResponse = async json => {
  let jsonString = JSON.stringify(json)
  let headers = RescriptBun.Globals.HeadersInit.FromArray([("content-type", "application/json")])

  RescriptBun.Globals.Response.make(jsonString, ~options={headers, status: 404})
}

let makeFileResponse = async path => {
  let file = RescriptBun.Bun.file(`./${path}`)

  RescriptBun.Globals.Response.makeFromFile(file)
}
