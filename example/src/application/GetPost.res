type args = {id: string}

type t = args => promise<option<Post.t>>

let make = (getPostFromDB): t => args => {
  getPostFromDB(args.id)
}
