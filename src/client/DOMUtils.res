@val external this: Dom.element = "this"
@val external body: Dom.element = "document.body"
external querySelector: string => option<Dom.element> = "this.querySelector"
// external querySelector: string => option<Dom.element> = "document.querySelector"
external querySelector: string => option<Dom.element> = "this.querySelector"
// external querySelectorAll: string => array<Dom.element> = "document.querySelectorAll"
external querySelectorAll: string => array<Dom.element> = "this.querySelectorAll"
// @send external getElementById: (Dom.document, string) => Dom.element = "getElementById"
@send
external addEventListener: (Dom.element, string, Dom.event => unit) => unit = "addEventListener"
@set external setText: (Dom.element, string) => unit = "innerText"
@send external show: Dom.element => unit = "show"
@send external showModal: Dom.element => unit = "showModal"
@send external close: Dom.element => unit = "close"

type viewTransition = {finished: promise<unit>}

@send
external startViewTransition: (Dom.document, unit => unit) => viewTransition = "startViewTransition"

@send external preventDefault: Dom.event => unit = "preventDefault"
@send external stopPropagation: Dom.event => unit = "stopPropagation"

let setStyle: (Dom.element, string, string) => unit = %ffi(`
  function(element, prop, value) {
    element.style[prop] = value;
  }
`)

@send external scrollBy: (Dom.element, int, int) => unit = "scrollBy"
