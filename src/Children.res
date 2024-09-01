@unboxed
type rec t =
  | String(string)
  | Number(float)
  | Array(array<t>)
  | Object(Dict.t<unknown>)
