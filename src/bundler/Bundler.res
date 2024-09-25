type options = {minify: bool, watch: bool}

module Internal = {
  type process

  @val external process: process = "process"
  @send external on: (process, string, unit => unit) => unit = "on"

  let bundle = options => {
    let srcDir = RescriptBun.Path.resolve(["./src"])
    let outDir = RescriptBun.Path.resolve(["./public/seco"])
    let assetMapPath = RescriptBun.Path.resolve(["./src/assetMap.mjs"])
    let pageSuffix = "_Page.mjs"

    let _ =
      PageFiles.get(~srcDir, ~pageSuffix)
      ->Promise.then(FilesProcessor.processFiles(~pageSuffix, ~outDir, ~minify=options.minify))
      ->Promise.thenResolve(SecoAssets.writeFile(assetMapPath))
  }

  let bundleWatch = (options: options) => {
    let srcDir = RescriptBun.Path.resolve(["./src"])

    bundle(options)

    let watcher = Watcher.watch(srcDir, {recursive: true}, (_event, filename) => {
      if (
        filename !== "assetMap.mjs" &&
          (String.endsWith(filename, ".mjs") || String.endsWith(filename, ".css~"))
      ) {
        Console.log(`Detected changes in file ${filename} => Rebuild...`)

        bundle(options)
      }
    })

    let _ = on(process, "SIGINT", _ => {
      Console.log("Closing watcher...")

      Watcher.close(watcher)
      RescriptBun.Process.exit(RescriptBun.Process.process, ())
    })
  }
}

let bundle = options => {
  switch options.watch {
  | true => Internal.bundleWatch(options)
  | false => Internal.bundle(options)
  }
}
