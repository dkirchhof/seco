let getUrl = req => req->RescriptBun.Globals.Request.url->RescriptBun.Url.make

let getPath = (url: RescriptBun.Url.t) =>
  String.split(url.pathname, "/")
  ->Array.filter(s => String.length(s) > 0)
  ->List.fromArray
