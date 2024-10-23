# Seco
Don't hydrate, stay dry!

## Introduction

**Seco** is a minimal web framework written in ReScript.

## Features

- **ReScript** - Write your configs, backend and frontend code in one language: ReScript.
- **Bun** - Use less tools: Bun is used as runtime, bundler and package manager.
- **Fast** - All tools in the chain are lightning fast.
- **Simple** - No magic, no blackboxes, clean borders between server-side and client-side code.
- **SSR** - Render all your pages on the server and inject minimal JavaScript afterward.
- **JSX** - Use JSX as a type-safe template language for your components.

## Motivation

Modern frameworks became complex. There is no clean border between server- and client-side code anymore.
This leads often to misunderstandings and in the worst case to significant security issues.
I have often run into problems, where tools like Webpack bundled server-side code, that was actually intended for the frontend. So you have to use `aliases`, `fallbacks` or whatever... I don't know. I don't want to care.
Conversely, client-side code can also cause problems in the backend.

There are a lot of frameworks that use file-based routing. It's fine while an application has only a few routes. But what if there a many routes in different locales?
You have to duplicate a lot of files / complete folder structures to create the same routes in different languages.
For example you want to have an "about" page in nextjs where the url, the layout and the page itself is localized:

- src/app/en/about/layout.tsx
- src/app/en/about/page.tsx
- src/app/de/über/layout.tsx
- src/app/de/über/page.tsx

If you wan't to use "en" as default / optional locale you have to add following files as well:

- src/app/about/layout.tsx
- src/app/about/page.tsx

Now add some more locales...

Another approach would be a middleware where you can `rewrite` static paths like "/about" and "/en/about" to "de/über" etc.
However, this middleware can quickly become very large and complex.

I want to structure my code the way I want. The locale has no place in the folder structure.
And I also don't care about all these `layout.tsx`, `not-found.tsx`, `loading.tsx` or `error.tsx` files.

What else? Just a list of some further pain points (in nextjs):
- scroll restoration
- hydration missmatches
- errors in `next build`, while in `next dev` everything is fine
- no compiler errors in `next dev` process
- static vs ssg vs dynamic pages
- huge memory consumption
- caching
- custom server, instrumentation.ts, websockets, ...

## Docs

### Config

There is not a lot of stuff which has to be configured. Well, some settings in the rescript.json are necessary:

```json
{
  "package-specs": [
    {
      "module": "esmodule",
      "in-source": true
    }
  ],
  "suffix": ".mjs",
  "bs-dependencies": [
    "@rescript/core",
    "rescript-bun",
    "seco"
  ],
  "bsc-flags": [
    "-open RescriptCore"
  ],
  "jsx": {
    "module": "Seco.JSX"
  }
}
```

The bundler can be configured in code:

```res
// Bundle.res
Bundler.bundle({minify: true, watch: false, assetMapDir: "./src"})
```

### Spinning up

You have to start 3 processes, the ReScript compiler, the bundler and the server.

The commands could look like this in production:

1. ReScript compiler: `rescript build`
2. Bundler: `bun src/Bundle.mjs`
3. Server: `bun src/Server.mjs`

Or like this in dev:

1. ReScript compiler: `rescript build -w`
2. Bundler: `bun src/BundleDev.mjs`
3. Server: `bun --hot src/Server.mjs`

### Server

Use [Bun.serve](https://bun.sh/docs/api/http) to start an http server:

```res
// Server.res

module Bun = RescriptBun.Bun

let server = Bun.serve({
  port: 3000,
  fetch: (req, server) => {
    Seco.Response.makeTextResponse("hello world")
  },
})
```

### Router

There is no built-in router. Especially no file-based one.
Just parse urls of incoming requests or use any router library and return responses:

```res
// Server.res (inside fetch fn of Bun.serve)

let url = Seco.Request.getUrl(req)
let path = Seco.Url.pathnameToList(url.pathname)

switch path {
| list{} => Seco.Response.makeTextResponse("home")
| list{"hello", name} => Seco.Response.makeTextResponse(`hello ${name}`)
| _ => Seco.Response.makeNotFoundTextResponse("nothing to see here")
}
```

### Components

You can define type-safe, async components with a JSX like syntax.

```res
// WithoutProps.res
let make = Seco.Component.make(async _ => {
  <div> {JSX.string("hello world")} </div>
})

```res
// WithProps.res
type props = {
  message: string
}

let make = Seco.ComponentP.make(async props => {
  <div> {JSX.string(props.message)} </div>
})
```

### Pages

Pages are just components for which script and style files are generated during the bundle process.
The bundler will find all files with the suffix `_Page.mjs` and handle them as pages.
More on scripts and styles later.

To render a page use the `makeHtmlResponse` function:

```res
Seco.Response.makeHtmlResponse(<Counter_Page />)
```

### Scripts

To create interactive components, you have to define client-side scripts.
You can define for each component (or page) a client-side script by using the `_Client.res` suffix.
For example a script for the `Counter_Page.res` has to be named `Counter_Page_Client.res`.
A script for the counter component `Counter.res` has to be named `Counter_Client.res`.

The bundler will find all `_Client.mjs` files used by the page and its components and creates a single js file for them.

### Styles

You can also define styles by using plain css.
Use the same filename as the component but with a `.css` extension.
Example `Counter_Page.res` => `Counter_Page.css`

The bundler will find all `.css` files used by the page and its components and creates a single css file.

### Assets map

All bundles scripts and styles will be referenced in an asset map located in the `assetMap.mjs` file.
The filename of the page will be used as the key. The value includes a relative path to the hashed script and style file.

Example:

```mjs
export const assets = {
  ".../src/counterPage/Counter_Page.mjs": {
    script: "/public/seco/Counter-t0803pv1.js",
    style: "/public/seco/Counter-3902223584726698264.css",
  },
};
```

For better ReScript support, it is recommended to create a wrapper like this:

```res
// Assets.res

@module("./assetMap.mjs")
@val external assets: Seco.SecoAssets.t = "assets"
```

To get the paths in a page component:

```res
// Counter_Page.res
let filename = RescriptBun.Global.filename

let assets = Dict.get(Assets.assets, filename)

let script = Option.flatMap(assets, a => a.script)->Option.getOr("")
let style = Option.flatMap(assets, a => a.style)->Option.getOr("")
```

### Demo

There are two demos in this project. A minimal example and a blog example.
Reference the source files of the demo, you want to test, in the `rescript.json` file.

Todo: use Rewatch when this [issue](https://github.com/rescript-lang/rewatch/issues/130) is fixed.

Run the following commands to start a demo in dev mode:

```sh
bun dev:res
cd blogExample && blogExample bun dev:bundle
cd blogExample && blogExample bun dev:server
```

> [!NOTE]
> The blog example uses some new (experimental) web features, which are only available in chrome.
