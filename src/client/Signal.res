type t<'a> = {
  mutable value: 'a,
  onChange: 'a => unit,
}

let make = (value, onChange) => {
  value,
  onChange,
}

let setValue = (t, value) => {
  t.value = value

  t.onChange(value)
}
