let make = result => BuilderPlugin.make({
  name: "CSS Imports Extractor",
  setup: build => {
    let filter = %re(`/\.css$/`)

    build.onLoad({filter: filter}, async args => {
      result->Array.push(args.path)
    })
  },
})
