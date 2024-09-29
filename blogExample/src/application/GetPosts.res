type args = unit

type t = args => promise<array<Post.t>>

let make = (getPostsFromDB): t => args => {
  getPostsFromDB(args)
}
