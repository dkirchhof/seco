type args = {id: string}

let make = (getPostFromDB: string => promise<option<Post.t>>, makeResponse) => args => {
  getPostFromDB(args.id)->Promise.then(makeResponse)
}
