@val external this: Dom.element = "this"
@val external document: Dom.element = "document"
@val external body: Dom.element = "document.body"

@send external querySelector: (Dom.element, string) => option<Dom.element> = "querySelector"
@send external querySelectorAll: (Dom.element, string) => array<Dom.element> = "querySelectorAll"

@send external addEventListener: (Dom.element, string, JsxEvent.synthetic<_> => unit) => unit = "addEventListener"

@set external setText: (Dom.element, string) => unit = "innerText"
@get external getValue: (Dom.element) => string = "value"
@set external setValue: (Dom.element, string) => unit = "value"
@set external setInnerHTML: (Dom.element, string) => unit = "innerHTML"

@send external show: Dom.element => unit = "show"
@send external showModal: Dom.element => unit = "showModal"
@send external close: Dom.element => unit = "close"
@send external focus: Dom.element => unit = "focus"

type viewTransition = {finished: promise<unit>}

@send external startViewTransition: (Dom.document, unit => unit) => viewTransition = "startViewTransition"

// @send external preventDefault: Dom.event => unit = "preventDefault"
// @send external stopPropagation: Dom.event => unit = "stopPropagation"

let setStyle: (Dom.element, string, string) => unit = %ffi(`
  function(element, prop, value) {
    element.style[prop] = value;
  }
`)

@send external scrollBy: (Dom.element, int, int) => unit = "scrollBy"
