let get = (~file, ~pageSuffix) => {
  let regExp = RegExp.fromString(`${pageSuffix}$`)

  let fileName = RescriptBun.Path.parse(file).base

  String.replaceRegExp(fileName, regExp, "")
}
