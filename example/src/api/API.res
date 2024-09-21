// https://picsum.photos/640/360

%%private(
  let posts: array<Post.t> = [
    {
      id: "1",
      slug: "my-first-post",
      date: "2024-09-09",
      title: "My first post",
      firstParagraph: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
      image: "https://fastly.picsum.photos/id/629/640/360.jpg?hmac=Eni5bZnhpD8vForbGbAqveaMXCQVaXqTR4P9_1_iLXw",
      content: [
        Text(
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
        ),
        Quote({
          quote: "Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.",
          quotee: "Test Testerson, Test",
        }),
        Text(
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
        ),
        Headline(H2, "Headline"),
        Text(
          "Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.",
        ),
        Separator,
        Text(
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
        ),
        Headline(H3, "Headline"),
        Text(
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
        ),
        Headline(H3, "Headline"),
        Text(
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
        ),
      ],
    },
    {
      id: "2",
      slug: "my-second-post",
      date: "2024-09-10",
      title: "My second post",
      firstParagraph: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
      image: "https://fastly.picsum.photos/id/675/640/360.jpg?hmac=2MM1FICbL3kNVU6QW8I6auu35cwpUrK_x_Mr9YKZ9_I",
      content: [],
    },
    {
      id: "3",
      slug: "my-third-post",
      date: "2024-09-11",
      title: "My third post",
      firstParagraph: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
      image: "https://fastly.picsum.photos/id/75/640/360.jpg?hmac=wP_Hwbwux2jb2DhSaBsgCdBYTCAtDV58fuU8szRUQew",
      content: [],
    },
    {
      id: "4",
      slug: "my-fourth-post",
      date: "2024-09-12",
      title: "My fourth post",
      firstParagraph: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
      image: "https://fastly.picsum.photos/id/186/640/360.jpg?hmac=l3VrnwhvnGZc0uyO7YsHj2kcWDaPkYWQ36RqhmuDNCM",
      content: [],
    },
    {
      id: "4",
      slug: "my-fourth-post",
      date: "2024-09-12",
      title: "My fourth post",
      firstParagraph: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
      image: "https://fastly.picsum.photos/id/186/640/360.jpg?hmac=l3VrnwhvnGZc0uyO7YsHj2kcWDaPkYWQ36RqhmuDNCM",
      content: [],
    },
    {
      id: "4",
      slug: "my-fourth-post",
      date: "2024-09-12",
      title: "My fourth post",
      firstParagraph: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
      image: "https://fastly.picsum.photos/id/186/640/360.jpg?hmac=l3VrnwhvnGZc0uyO7YsHj2kcWDaPkYWQ36RqhmuDNCM",
      content: [],
    },
    {
      id: "4",
      slug: "my-fourth-post",
      date: "2024-09-12",
      title: "My fourth post",
      firstParagraph: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
      image: "https://fastly.picsum.photos/id/186/640/360.jpg?hmac=l3VrnwhvnGZc0uyO7YsHj2kcWDaPkYWQ36RqhmuDNCM",
      content: [],
    },
    {
      id: "4",
      slug: "my-fourth-post",
      date: "2024-09-12",
      title: "My fourth post",
      firstParagraph: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
      image: "https://fastly.picsum.photos/id/186/640/360.jpg?hmac=l3VrnwhvnGZc0uyO7YsHj2kcWDaPkYWQ36RqhmuDNCM",
      content: [],
    },
    {
      id: "4",
      slug: "my-fourth-post",
      date: "2024-09-12",
      title: "My fourth post",
      firstParagraph: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
      image: "https://fastly.picsum.photos/id/186/640/360.jpg?hmac=l3VrnwhvnGZc0uyO7YsHj2kcWDaPkYWQ36RqhmuDNCM",
      content: [],
    },
    {
      id: "4",
      slug: "my-fourth-post",
      date: "2024-09-12",
      title: "My fourth post",
      firstParagraph: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
      image: "https://fastly.picsum.photos/id/186/640/360.jpg?hmac=l3VrnwhvnGZc0uyO7YsHj2kcWDaPkYWQ36RqhmuDNCM",
      content: [],
    },
    {
      id: "4",
      slug: "my-fourth-post",
      date: "2024-09-12",
      title: "My fourth post",
      firstParagraph: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
      image: "https://fastly.picsum.photos/id/186/640/360.jpg?hmac=l3VrnwhvnGZc0uyO7YsHj2kcWDaPkYWQ36RqhmuDNCM",
      content: [],
    },
    {
      id: "4",
      slug: "my-fourth-post",
      date: "2024-09-12",
      title: "My fourth post",
      firstParagraph: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
      image: "https://fastly.picsum.photos/id/186/640/360.jpg?hmac=l3VrnwhvnGZc0uyO7YsHj2kcWDaPkYWQ36RqhmuDNCM",
      content: [],
    },
    {
      id: "4",
      slug: "my-fourth-post",
      date: "2024-09-12",
      title: "My fourth post",
      firstParagraph: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
      image: "https://fastly.picsum.photos/id/186/640/360.jpg?hmac=l3VrnwhvnGZc0uyO7YsHj2kcWDaPkYWQ36RqhmuDNCM",
      content: [],
    },
    {
      id: "4",
      slug: "my-fourth-post",
      date: "2024-09-12",
      title: "My fourth post",
      firstParagraph: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
      image: "https://fastly.picsum.photos/id/186/640/360.jpg?hmac=l3VrnwhvnGZc0uyO7YsHj2kcWDaPkYWQ36RqhmuDNCM",
      content: [],
    },
    {
      id: "4",
      slug: "my-fourth-post",
      date: "2024-09-12",
      title: "My fourth post",
      firstParagraph: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
      image: "https://fastly.picsum.photos/id/186/640/360.jpg?hmac=l3VrnwhvnGZc0uyO7YsHj2kcWDaPkYWQ36RqhmuDNCM",
      content: [],
    },
    {
      id: "4",
      slug: "my-fourth-post",
      date: "2024-09-12",
      title: "My fourth post",
      firstParagraph: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
      image: "https://fastly.picsum.photos/id/186/640/360.jpg?hmac=l3VrnwhvnGZc0uyO7YsHj2kcWDaPkYWQ36RqhmuDNCM",
      content: [],
    },
  ]
)

let getPosts = async () => posts

let getPost = async id => {
  posts->Array.find(post => post.id === id)
}
