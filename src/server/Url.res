let pathnameToList = path =>
  String.split(path, "/")
  ->Array.filter(s => String.length(s) > 0)
  ->List.fromArray
