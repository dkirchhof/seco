module FS = {
  type options = {recursive: bool}

  @module("fs/promises")
  external readDir: (string, options) => promise<array<string>> = "readdir"
}

let get = async (~srcDir, ~pageSuffix) => {
  let files = await FS.readDir(srcDir, {recursive: true})

  files
  ->Array.filter(file => file->String.endsWith(pageSuffix))
  ->Array.map(_, r => RescriptBun.Path.resolve([srcDir, r]))
}
