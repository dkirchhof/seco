let processFile = async (~file, ~pageSuffix, ~outDir, ~minify) => {
  let pageName = PageName.get(~file, ~pageSuffix)

  Console.log(`${pageName}:`)

  let scannerResult = await Scanner.scanFile(file)

  // Console.log(scannerResult.scriptSiblings)
  // Console.log(scannerResult.styleSiblings)
  // Console.log(scannerResult.styleImports)

  let scriptFiles = scannerResult.scriptSiblings
  let script = await ScriptBundler.bundle(pageName, scriptFiles, outDir, minify)

  let styleFiles = Array.concat(scannerResult.styleImports, scannerResult.styleSiblings)
  let style = await StyleBundler.bundle(pageName, styleFiles, outDir, minify)

  Console.log("")

  let pageAssets: SecoAssets.pageAssets = {script, style}

  (pageName, pageAssets)
}

let processFiles = (~pageSuffix, ~outDir, ~minify) => async files => {
  let assets: SecoAssets.t = Map.make()

  // pageFiles->Array.map(processFile(src, public, minify))->Promise.all

  for i in 0 to Array.length(files) - 1 {
    let file = Array.getUnsafe(files, i)
    let (pageName, asset) = await processFile(~file, ~pageSuffix, ~outDir, ~minify)

    Map.set(assets, pageName, asset)
  }

  assets
}
