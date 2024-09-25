open RescriptBun

type pageAssets = {
  script: option<string>,
  style: option<string>,
}

type t = Dict.t<pageAssets>

let writeFile = assetMapPath => async assets => {
  let stringBuilder = [`export const assets = {`]

  assets
  ->Dict.toArray
  ->Array.forEach(((path, pageAssets)) => {
    switch (pageAssets.script, pageAssets.style) {
    | (Some(script), Some(style)) => {
        Array.push(stringBuilder, `  "${path}": {`)
        Array.push(stringBuilder, `    script: "${script}",`)
        Array.push(stringBuilder, `    style: "${style}",`)
        Array.push(stringBuilder, `  },`)
      }
    | (Some(script), None) => {
        Array.push(stringBuilder, `  "${path}": {`)
        Array.push(stringBuilder, `    script: "${script}",`)
        Array.push(stringBuilder, `  },`)
      }
    | (None, Some(style)) => {
        Array.push(stringBuilder, `  "${path}": {`)
        Array.push(stringBuilder, `    style: "${style}",`)
        Array.push(stringBuilder, `  },`)
      }
    | (None, None) => ()
    }
  })

  Array.push(stringBuilder, `};`)

  let content = stringBuilder->Array.join("\n")

  let _ = await Bun.Write.write(
    ~destination=Bun.Write.Destination.fromPath(assetMapPath),
    ~input=Bun.Write.Input.fromString(content),
  )
}
