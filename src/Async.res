let promises = []

let get = () => {
  Array.push(promises, async () => "async hello world")
}
