open RescriptBun

type result = {
  scriptSiblings: array<string>,
  styleSiblings: array<string>,
  styleImports: array<string>,
}

let scanFile = async file => {
  let siblings: SiblingsExtractor.result = {
    scriptSiblings: [],
    styleSiblings: [],
  }

  let styleImports = []

  let _ = await Bun.build({
    entrypoints: [file],
    plugins: [SiblingsExtractor.make(siblings), CSSImportsExtractor.make(styleImports)],
  })

  {
    scriptSiblings: siblings.scriptSiblings,
    styleSiblings: siblings.styleSiblings,
    styleImports,
  }
}
