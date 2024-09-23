let findPosts = async query => {
  let response = await Fetch.fetch(`/api/findPosts?q=${query}`)

  if response.ok {
    let json = await Fetch.Response.json(response)

    let result: array<Post.t> = Obj.magic(json)

    result
  } else {
    panic("failes to fetch posts")
  }
}
