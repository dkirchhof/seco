type t

type options = {recursive: bool}

@module("fs")
external watch: (string, options, ('a, string) => unit) => t = "watch"

@send
external close: t => unit = "close"
