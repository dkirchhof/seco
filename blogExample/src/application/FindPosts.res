type args = {query: string}

type t = args => promise<array<Post.t>>

let make = (findPostsFromDB): t => args => {
  let query = String.toLowerCase(args.query)

  switch query {
  | "" => Promise.resolve([])
  | _ => findPostsFromDB(query)
  }
}
