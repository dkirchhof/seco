module Response = {
  type t = {ok: bool}

  @send external text: t => promise<string> = "text"
  @send external json: t => promise<JSON.t> = "json"
}

// type options = {method: [#POST], headers: {"Content-Type": string}, body: string}

// external fetch: (string, options) => promise<Response.t> = "fetch"

external fetch: (string) => promise<Response.t> = "fetch"
