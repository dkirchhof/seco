type props = {items: array<(string, string)>}

@jsx.componentWithProps
let make = props => {
  let name = Math.random()->(Float.toString(_, ~radix=36))->String.substring(~start=7)

  <section class="block accordeon" role="group">
    {props.items
    ->Array.map(((summary, content)) =>
      <details name>
        <summary> {Jsx.string(summary)} </summary>
        <span> {Jsx.string(content)} </span>
      </details>
    )
    ->Jsx.array}
  </section>
}
