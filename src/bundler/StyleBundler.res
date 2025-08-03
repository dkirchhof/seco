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

    let result = LightningCSS.bundle({
      filename: tmpPath,
      targets: {
        chrome: 128,
      },
      minify,
    })

    let hash = result.code->uint8ArrayToBuffer->Obj.magic->Bun.Hash.hashArrayBuffer->Float.toString

    let path = `${outDir}/${pageName}-${hash}.css`

    let _ = await Bun.Write.write(
      ~destination=Bun.Write.Destination.fromPath(path),
      ~input=Bun.Write.Input.fromTypedArray(result.code->Obj.magic),
    )

    let relativePath = Path.relative(~from="", ~to_=path)

    Console.log("style  ")

    Some(`/${relativePath}`)
  } else {
    None
  }
}
