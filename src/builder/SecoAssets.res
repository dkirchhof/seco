open RescriptBun

type pageAssets = {
  script: option<string>,
  style: option<string>,
}

type t = Map.t<string, pageAssets>

let writeFile = assetsPath => async assets => {
  let optionToString = opt =>
    switch opt {
    | Some(s) => `Some("${s}")`
    | None => "None"
    }

  let content =
    assets
    ->Map.entries
    ->Array.fromIterator
    ->Array.map(((pageName, pageAssets)) => {
      [
        `module ${pageName} = {`,
        `  let script = ${optionToString(pageAssets.script)}`,
        `  let style = ${optionToString(pageAssets.style)}`,
        `}`,
      ]->Array.join("\n")
    })
    ->Array.join("\n\n")

  // Console.log(content)

  let _ = await Bun.Write.write(
    ~destination=Bun.Write.Destination.fromPath(assetsPath),
    ~input=Bun.Write.Input.fromString(content),
  )
}
