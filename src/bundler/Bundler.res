type options = {minify: bool, watch: bool, assetMapDir: string}

module Internal = {
  type process

  @val external process: process = "process"
  @send external on: (process, string, unit => unit) => unit = "on"

  let ensureAssetMapFile = async path => {
    open RescriptBun

    let exists = await Bun.file(path)->Bun.BunFile.exists

    if !exists {
      let _ = await Bun.Write.write(
        ~destination=Bun.Write.Destination.fromPath(path),
        ~input=Bun.Write.Input.fromString(""),
      )
    }
  }

  let bundle = async options => {
    let srcDir = RescriptBun.Path.resolve(["./src"])
    let outDir = RescriptBun.Path.resolve(["./public/seco"])
    let assetMapPath = RescriptBun.Path.resolve([options.assetMapDir, "assetMap.mjs"])
    let pageSuffix = "_Page.mjs"

    await ensureAssetMapFile(assetMapPath)

    let files = await PageFiles.get(~srcDir, ~pageSuffix)
    let pageAssets = await FilesProcessor.processFiles(~files, ~pageSuffix, ~outDir, ~minify=options.minify)

    await SecoAssets.writeFile(pageAssets, assetMapPath)
  }

  let bundleWatch = (options: options) => {
    let srcDir = RescriptBun.Path.resolve(["./src"])

    bundle(options)->ignore

    let watcher = Watcher.watch(srcDir, {recursive: true}, (_event, filename) => {
      if (
        !String.endsWith(filename, "assetMap.mjs") &&
        (String.endsWith(filename, ".mjs") || String.endsWith(filename, ".css~"))
      ) {
        Console.log(`Detected changes in file ${filename} => Rebuild...`)

        bundle(options)->ignore
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
  | false => Internal.bundle(options)->ignore
  }
}
