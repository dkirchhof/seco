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
  ->Array.map(((key, value)) => ` ${key}="${value}"`)
  ->Array.join("")
}

let rec toString = async (node: Node.t<_>) => {
  await (
    switch node {
    | Component(comp) => {
        let x = await comp.tag(comp.props)

        toString(Obj.magic(x))
      }
    | Tag(t) => {
        let attributes = propsToAttributesString(t.props)

        let children =
          await t.children
          ->Array.map(child => {
            toString(child)
          })
          ->Promise.all

        let children = Array.join(children, "")


        // const children: string[] = [];
        // for (const child of element.children) {
        //   const str = await $jsxToString.call(this, child);
        //   if (str.length > 0) {
        //     children.push(str);
        //   }
        // }

        // return `<${element.tag}${separator}${attributes}>${children.join("")}</${
        //   element.tag
        // }>`;

        Promise.resolve(`<${t.tag}${attributes}>${children}</${t.tag}>`)
      }

    | TextNode(t) => Promise.resolve(t.text)
    }
  )
}

let render = (element: Jsx.element) => {
  element->Obj.magic->toString
}
