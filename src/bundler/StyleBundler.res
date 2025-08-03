open RescriptBun

module LightningCSS = {
  type targets = {chrome: int}

  type bundleOptions = {
    filename: string,
    minify: bool,
    targets: targets,
  }

  type bundleResult = {code: Uint8Array.t}

  @module("lightningcss")
  external bundle: bundleOptions => bundleResult = "bundle"
}

@get
external uint8ArrayToBuffer: Uint8Array.t => ArrayBuffer.t = "buffer"

let bundle = async (pageName, styleFiles, outDir, minify) => {
  if Array.length(styleFiles) > 0 {
    let content = styleFiles->Array.map(f => `@import "${f}";`)->Array.join("\n")

    let tmpPath = `${Os.tmpdir()}/seco/${pageName}.css`

    let _ = await Bun.Write.write(
      ~destination=Bun.Write.Destination.fromPath(tmpPath),
      ~input=Bun.Write.Input.fromString(content),
    )

    let result = await Bun.build({
      entrypoints: [tmpPath],
      outdir: outDir,
      naming: String(`${pageName}-[hash].css`),
      minify: Bool(minify),
    })

    if result.success {
      let result' = result.outputs->Array.getUnsafe(0)
      let relativePath = Path.relative(~from="", ~to_=result'.path)

      Console.log("style  ")

      Some(`/${relativePath}`)
    } else {
      Console.error("style  ")

      None
    }
  } else {
    None
  }
}
