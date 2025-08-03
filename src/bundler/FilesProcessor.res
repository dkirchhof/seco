module FS = {
  type options = {recursive: bool, force: bool}

  @module("fs/promises")
  external rm: (string, options) => promise<unit> = "rm"
}

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

  pageAssets
}

let processFiles = async (~files, ~pageSuffix, ~outDir, ~minify) => {
  await FS.rm(outDir, { recursive: true, force: true })

  let assets: SecoAssets.t = Dict.make()

  // pageFiles->Array.map(processFile(src, public, minify))->Promise.all

  for i in 0 to Array.length(files) - 1 {
    let file = Array.getUnsafe(files, i)
    let pageAssets = await processFile(~file, ~pageSuffix, ~outDir, ~minify)

    Dict.set(assets, file, pageAssets)
  }

  assets
}
