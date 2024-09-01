@send
external replaceChild: (Jsx.element, Jsx.element) => unit = "replaceChildren"

@send
@variadic
external replaceChildren: (Jsx.element, array<Jsx.element>) => unit = "replaceChildren"

@send
external appendChild: (Jsx.element, Jsx.element) => unit = "append"

@send @variadic
external appendChildren: (Jsx.element, array<Jsx.element>) => unit = "append"

@send
external _setAttribute: (Jsx.element, ~attribute: string, ~value: string) => unit = "setAttribute"

@send
external _removeAttribute: (Jsx.element, string) => unit = "removeAttribute"

@unboxed
type value = Boolean(bool) | Unknown

let setAttribute = (element, attribute, value) => {
  switch value {
  | Boolean(true) => _setAttribute(element, ~attribute, ~value="")
  | Boolean(false) => _removeAttribute(element, attribute)
  // | Unknown => _setAttribute(element, ~attribute, ~value=Obj.magic(value))
  | Unknown => element->Obj.magic->Dict.set(attribute, value)
  }
}

@send
external addEventListener: (Jsx.element, string, 'a => unit) => unit = "addEventListener"

@send
external createElement: (Dom.document, string) => Jsx.element = "createElement"

@send
external createTextNode: (Dom.document, string) => Jsx.element = "createTextNode"

@get
external getChildNodes: Jsx.element => array<Jsx.element> = "childNodes"

@set
external setInnerHTML: (Jsx.element, string) => unit = "innerHTML"
