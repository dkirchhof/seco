external querySelector: string => option<Dom.element> = "this.querySelector"

@send external addEventListener: (Dom.element, string, JsxEvent.synthetic<_> => unit) => unit = "addEventListener"

@get external getText: (Dom.element) => string = "innerText"
@set external setText: (Dom.element, string) => unit = "innerText"
