module FS = {
  type options = {recursive: bool}

  @module("fs/promises")
  external readDir: (string, options) => promise<array<string>> = "readdir"
}

let get = (~srcDir, ~pageSuffix) => {
  FS.readDir(srcDir, {recursive: true})
  ->Promise.thenResolve(Array.filter(_, file => file->String.endsWith(pageSuffix)))
  ->Promise.thenResolve(Array.map(_, r => RescriptBun.Path.resolve([srcDir, r])))
}
