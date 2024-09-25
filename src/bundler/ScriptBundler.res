open RescriptBun

let bundle = async (pageName, scriptFiles, outDir, minify) => {
  if Array.length(scriptFiles) > 0 {
    let content = scriptFiles->Array.map(f => `import "${f}";`)->Array.join("\n")

    let tmpPath = `${Os.tmpdir()}/seco/${pageName}.mjs`

    let _ = await Bun.Write.write(
      ~destination=Bun.Write.Destination.fromPath(tmpPath),
      ~input=Bun.Write.Input.fromString(content),
    )

    let result = await Bun.build({
      entrypoints: [tmpPath],
      outdir: outDir,
      naming: String(`${pageName}-[hash].js`),
      minify: Bool(minify),
    })

    if result.success {
      let result' = result.outputs->Array.getUnsafe(0)
      let relativePath = Path.relative(~from="", ~to_=result'.path)

      Console.log("script  ")

      Some(`/${relativePath}`)
    } else {
      Console.error("script  ")

      None
    }
  } else {
    None
  }
}
