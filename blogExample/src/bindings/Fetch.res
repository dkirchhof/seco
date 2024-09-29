module Response = {
  type t = {ok: bool}

  @send external text: t => promise<string> = "text"
  @send external json: t => promise<JSON.t> = "json"
}

external fetch: (string) => promise<Response.t> = "fetch"
