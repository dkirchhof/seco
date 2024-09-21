type pluginConstraints = {filter: RegExp.t}

type onLoadArgs = {path: string}

type onLoadCallback = onLoadArgs => promise<unit>

type pluginBuilder = {onLoad: (pluginConstraints, onLoadCallback) => unit}

type t = {
  name: string,
  setup: pluginBuilder => unit,
}

external make: t => RescriptBun.Bun.BunPlugin.t = "%identity"
