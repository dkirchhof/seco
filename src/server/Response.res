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

let makeNotFoundTextResponse = async text => {
  RescriptBun.Globals.Response.make(text, ~options={status: 404})
}

let makeFileResponse = async path => {
  let file = RescriptBun.Bun.file(`./${path}`)

  RescriptBun.Globals.Response.makeFromFile(file)
}

let makeJsonResponse = async data => {
  let json = data->JSON.stringifyAny->Option.getExn
  let headers = RescriptBun.Globals.HeadersInit.FromArray([("content-type", "application/json")])

  RescriptBun.Globals.Response.make(json, ~options={headers: headers})
}
