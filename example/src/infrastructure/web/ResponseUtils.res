open RescriptBun.Globals

let htmlResponse = async (component, props) => {
  let element = JSX.jsx(component, { props }) 
  let html = await Renderer.render(element, false)
  let headers = HeadersInit.FromArray([("content-type", "text/html")])

  Response.make(html, ~options={headers: headers})
}

let jsonResponse = async data => {
  let json = data->JSON.stringifyAny->Option.getExn
  let headers = HeadersInit.FromArray([("content-type", "application/json")])

  Response.make(json, ~options={headers: headers})
}
