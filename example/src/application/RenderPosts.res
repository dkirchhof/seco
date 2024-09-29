type args = unit

let make = (getPostsFromDB, makeResponse) => args => {
  getPostsFromDB()->Promise.then(makeResponse)
}
