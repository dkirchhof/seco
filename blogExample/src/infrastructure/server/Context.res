type t = {mutable req: RescriptBun.Globals.Request.t}

%%private(
  let context = {
    req: Obj.magic(),
  }
)

let setRequest = req => {
  context.req = req
}

let getRequest = () => context.req
