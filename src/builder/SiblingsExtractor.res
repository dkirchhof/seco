open RescriptBun

type result = {
  scriptSiblings: array<string>,
  styleSiblings: array<string>,
}

let make = result =>
  BuilderPlugin.make({
    name: "Siblings Extractor",
    setup: build => {
      let filter = %re(`/\.mjs$/`)

      build.onLoad({filter: filter}, async args => {
        let scriptSiblingPath = String.replaceRegExp(args.path, filter, "_Client.mjs")

        if await Bun.file(scriptSiblingPath)->Bun.BunFile.exists {
          result.scriptSiblings->Array.push(scriptSiblingPath)
        }

        let styleSiblingPath = String.replaceRegExp(args.path, filter, `.css`)

        if await Bun.file(styleSiblingPath)->Bun.BunFile.exists {
          result.styleSiblings->Array.push(styleSiblingPath)
        }
      })
    },
  })
