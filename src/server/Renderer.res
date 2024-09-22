let voidTags = Set.fromArray([
  "area",
  "base",
  "br",
  "col",
  "embed",
  "hr",
  "img",
  "input",
  "link",
  "meta",
  "param",
  "source",
  "track",
  "wbr",
])

// function attributeToString([key, value]: [string, any]): string {
//   if (value === true) {
//     return key;
//   }
//   if (value === false || value === null || value === undefined) {
//     return "";
//   }
//   if (typeof value === "object") {
//     switch (key) {
//       case "style":
//         const styles = Object.entries(value).map(([k, v]) => `${k}: ${v}`);
//         return `style="${escapeQuotes(styles.join("; "))}"`;
//       case "class":
//         const classes = Object.entries(value)
//           .filter(([k, v]) => v)
//           .map(([k, v]) => k);
//         return classes.length > 0
//           ? `class="${escapeQuotes(classes.join(" "))}"`
//           : "";
//       default:
//         return `${key}="${escapeQuotes(JSON.stringify(value))}"`;
//     }
//   }
//   return `${key}="${escapeQuotes(value.toString())}"`;
// }

// function escapeQuotes(str: string) {
//   return str.replaceAll('"', "&quot;");
// }

let propsToAttributesString = props => {
  props
  ->Obj.magic
  ->Dict.toArray
  ->Array.filter(((key, _value)) => key !== "children")
  ->Array.map(((key, value: Attribute.t)) => {
    switch value {
    | String(s) => ` ${key}="${s}"`
    | Number(n) => ` ${key}="${Float.toString(n)}"`
    | Bool(true) => ` ${key}`
    | Bool(false) | Null | Undefined => ""
    }
  })
  ->Array.join("")
}

let rec toString = async (node: Nullable.t<Node.t<_>>) => {
  await (
    switch node {
    | Value(Component(comp)) => {
        let x = await comp.tag(comp.props)

        toString(Obj.magic(x))
      }
    | Value(Fragment(comp)) => {
        let children =
          (await comp.props
          ->Obj.magic
          ->Dict.getUnsafe("children")
          ->Array.map(toString)
          ->Promise.all)
          ->Array.join("")

        Promise.resolve(children)
      }
    | Value(Tag(t)) => {
        let attributes = propsToAttributesString(t.props)

        if Set.has(voidTags, t.tag) {
          Promise.resolve(`<${t.tag}${attributes}>`)
        } else {
          let children =
            (await t.props
            ->Obj.magic
            ->Dict.getUnsafe("children")
            ->Array.map(toString)
            ->Promise.all)
            ->Array.join("")

          Promise.resolve(`<${t.tag}${attributes}>${children}</${t.tag}>`)
        }
      }
    | Value(TextNode(t)) => Promise.resolve(t.text)
    | Undefined | Null => Promise.resolve("")
    }
  )
}

@module("simply-beautiful")
external formatHtml: string => string = "html"

let render = async (element: Jsx.element, beautify: bool) => {
  let html = await element->Obj.magic->toString

  if beautify {
    formatHtml(html)
  } else {
    html
  }
}
