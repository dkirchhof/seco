type options = {minify: bool}

let build = (options: options) => {
  let srcDir = RescriptBun.Path.resolve(["./src"])
  let outDir = RescriptBun.Path.resolve(["./public/seco"])
  let assetsPath = RescriptBun.Path.resolve(["./src/Assets.res"])
  let pageSuffix = "_Page.mjs"

  let _ =
    PageFiles.get(~srcDir, ~pageSuffix)
    ->Promise.then(FilesProcessor.processFiles(~pageSuffix, ~outDir, ~minify=options.minify))
    ->Promise.thenResolve(SecoAssets.writeFile(assetsPath))
}
