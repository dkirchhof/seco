module ReadDir = {
  type options = {recursive: bool}

  @module("fs/promises")
  external read: (string, options) => promise<array<string>> = "readdir"
}

let get = (~srcDir, ~pageSuffix) => {
  ReadDir.read(srcDir, {recursive: true})
  ->Promise.thenResolve(Array.filter(_, file => file->String.endsWith(pageSuffix)))
  ->Promise.thenResolve(Array.map(_, r => RescriptBun.Path.resolve([srcDir, r])))
}
