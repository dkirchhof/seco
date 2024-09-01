module CSSStyleSheet = {
  type t

  @new
  external make: unit => t = "CSSStyleSheet"

  @send
  external replace: (t, string) => unit = "replace"
}
