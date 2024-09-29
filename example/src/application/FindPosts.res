type args = {query: string}

type t = args => promise<array<Post.t>>

let make = (findPostsFromDB, makeResponse): t => args => {
  let query = String.toLowerCase(args.query)

  let data = switch query {
  | "" => Promise.resolve([])
  | _ => findPostsFromDB(query)
  }


  data->Promise.then(makeResponse)
}
