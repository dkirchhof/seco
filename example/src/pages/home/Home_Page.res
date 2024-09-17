type props = {pathname: string}

let make = ComponentP.make(async props => {
  <Page pathname=props.pathname title="DK" style=Assets.Home.style script=Assets.Home.script>
    <h1> {JSX.string("DK")} </h1>
    <Text text="This is a Website" />
    <Slider
      images=[
        "https://fastly.picsum.photos/id/629/640/360.jpg?hmac=Eni5bZnhpD8vForbGbAqveaMXCQVaXqTR4P9_1_iLXw",
        "https://fastly.picsum.photos/id/675/640/360.jpg?hmac=2MM1FICbL3kNVU6QW8I6auu35cwpUrK_x_Mr9YKZ9_I",
        "https://fastly.picsum.photos/id/75/640/360.jpg?hmac=wP_Hwbwux2jb2DhSaBsgCdBYTCAtDV58fuU8szRUQew",
        "https://fastly.picsum.photos/id/186/640/360.jpg?hmac=l3VrnwhvnGZc0uyO7YsHj2kcWDaPkYWQ36RqhmuDNCM",
      ]
    />
  </Page>
})
