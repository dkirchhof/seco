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
      slug: "exploring-the-mountains",
      date: "2024-08-15",
      title: "Exploring the Mountains",
      firstParagraph: "Mountains are beautiful, majestic, and awe-inspiring. Hiking through them is a journey of both physical and mental endurance.",
      image: "https://fastly.picsum.photos/id/937/640/360.jpg?hmac=Kz3R5T-XnsmFS0WEyVt6NG1nLgrKOA2EBvi0loj-xOo",
      content: [
        Text(
          "Hiking in the mountains offers a unique challenge. You are rewarded with breathtaking views and a sense of accomplishment.",
        ),
        Quote({
          quote: "The best view comes after the hardest climb.",
          quotee: "Anonymous",
        }),
        Headline(H2, "Preparation is Key"),
        Text(
          "Before setting off, it's crucial to prepare adequately. Carry enough water, wear proper shoes, and plan your route.",
        ),
        Separator,
        Text(
          "As you ascend, the air becomes thinner, and the trail more difficult. But the reward at the summit is indescribable.",
        ),
      ],
    },
    {
      id: "3",
      slug: "the-art-of-cooking",
      date: "2024-07-22",
      title: "The Art of Cooking",
      firstParagraph: "Cooking is not just about following recipes. It's about creativity, passion, and the joy of sharing delicious meals.",
      image: "https://fastly.picsum.photos/id/494/640/360.jpg?hmac=JTkvhtaIG8Rp8u7o8zbbk8DTcSmPPKNHJSWdGh7O8SM",
      content: [
        Text(
          "Cooking allows you to express yourself in the kitchen. Every dish is a new opportunity to create something unique.",
        ),
        Headline(H2, "Mastering the Basics"),
        Text(
          "Start with simple techniques, like boiling, frying, and sautéing. Mastering these will give you a strong foundation.",
        ),
        Quote({
          quote: "The secret ingredient is always love.",
          quotee: "Unknown Chef",
        }),
        Text(
          "Experiment with flavors, and don’t be afraid to fail. Every mistake is a lesson learned.",
        ),
        Separator,
      ],
    },
    {
      id: "4",
      slug: "the-history-of-technology",
      date: "2024-06-12",
      title: "The History of Technology",
      firstParagraph: "Technology has advanced rapidly, shaping our world in ways we never thought possible. From the wheel to the smartphone, humanity's inventions have revolutionized life.",
      image: "https://fastly.picsum.photos/id/361/640/360.jpg?hmac=m-wyvOPcMrMj5nMjAqk8LVxopmcPas9wVEmUzxnoQuI",
      content: [
        Text(
          "The invention of the wheel was one of the earliest technological breakthroughs. It allowed for easier transportation and labor.",
        ),
        Headline(H2, "The Industrial Revolution"),
        Text(
          "The Industrial Revolution in the 18th century marked a major turning point. Machines began to take over manual labor, greatly increasing productivity.",
        ),
        Quote({
          quote: "Technology is a useful servant but a dangerous master.",
          quotee: "Christian Lous Lange",
        }),
        Text(
          "Today, we rely heavily on technology for communication, transportation, and even healthcare.",
        ),
      ],
    },
    {
      id: "5",
      slug: "understanding-mindfulness",
      date: "2024-05-01",
      title: "Understanding Mindfulness",
      firstParagraph: "Mindfulness is the practice of being fully present in the moment. It helps reduce stress, increase focus, and improve overall well-being.",
      image: "https://fastly.picsum.photos/id/413/640/360.jpg?hmac=t6X-MZuJOPsL4YxUE6PFXngFsGsqW5v-2ls6DCTl0BQ",
      content: [
        Text(
          "Mindfulness encourages you to focus on the present moment, paying attention to your thoughts and feelings without judgment.",
        ),
        Headline(H3, "The Science Behind Mindfulness"),
        Text(
          "Studies have shown that mindfulness can lead to reduced stress, lower blood pressure, and better sleep.",
        ),
        Quote({
          quote: "Mindfulness is the awareness that arises through paying attention on purpose, in the present moment, and non-judgmentally.",
          quotee: "Jon Kabat-Zinn",
        }),
        Text(
          "By practicing mindfulness regularly, you can develop a greater sense of self-awareness and calm.",
        ),
      ],
    },
    {
      id: "6",
      slug: "journey-through-ancient-rome",
      date: "2024-04-14",
      title: "A Journey Through Ancient Rome",
      firstParagraph: "Ancient Rome was one of the most powerful civilizations in history. Its influence on modern culture, language, and architecture remains undeniable.",
      image: "https://fastly.picsum.photos/id/81/640/360.jpg?hmac=fqd4hKPpkmI8P0RFsUoCnNJwkngh_trvqn4fi6ef_4M",
      content: [
        Text(
          "Rome was founded in 753 BC and grew to become the dominant power in the Mediterranean.",
        ),
        Headline(H3, "The Roman Empire"),
        Text(
          "At its height, the Roman Empire controlled vast territories across Europe, North Africa, and the Middle East.",
        ),
        Quote({
          quote: "All roads lead to Rome.",
          quotee: "Ancient Proverb",
        }),
        Separator,
        Text("Today, we still see Roman influence in modern law, government, and engineering."),
      ],
    },
    {
      id: "7",
      slug: "the-importance-of-exercise",
      date: "2024-03-21",
      title: "The Importance of Exercise",
      firstParagraph: "Exercise is essential for maintaining both physical and mental health. Regular physical activity can improve your mood, boost energy, and reduce the risk of chronic diseases.",
      image: "https://fastly.picsum.photos/id/1059/640/360.jpg?hmac=faV2tFDKpvXD_FgJ-n0ufg5RiaatZ4mzNEFELCXyYew",
      content: [
        Text(
          "Regular exercise can help improve your cardiovascular health, strengthen muscles, and enhance flexibility.",
        ),
        Headline(H2, "Exercise and Mental Health"),
        Text(
          "Exercise releases endorphins, which help reduce stress and improve mood. It's one of the best natural ways to boost mental health.",
        ),
        Quote({
          quote: "To enjoy the glow of good health, you must exercise.",
          quotee: "Gene Tunney",
        }),
        Separator,
        Text(
          "Whether it's a walk in the park or an intense gym session, any form of movement is beneficial.",
        ),
      ],
    },
    {
      id: "8",
      slug: "discovering-the-ocean",
      date: "2024-02-17",
      title: "Discovering the Ocean",
      firstParagraph: "The ocean covers more than 70% of our planet. It's home to a vast array of species and plays a crucial role in regulating the Earth's climate.",
      image: "https://fastly.picsum.photos/id/75/640/360.jpg?hmac=wP_Hwbwux2jb2DhSaBsgCdBYTCAtDV58fuU8szRUQew",
      content: [
        Text(
          "The ocean is teeming with life, from the tiniest plankton to the largest whales. It provides us with food, oxygen, and endless fascination.",
        ),
        Headline(H3, "The Deep Sea"),
        Text(
          "The deep sea is one of the least explored areas on Earth. It remains a mystery, with many undiscovered species and ecosystems.",
        ),
        Quote({
          quote: "The ocean stirs the heart, inspires the imagination, and brings eternal joy to the soul.",
          quotee: "Wyland",
        }),
        Text(
          "Our relationship with the ocean is critical. We must protect it for future generations.",
        ),
      ],
    },
    {
      id: "9",
      slug: "the-power-of-music",
      date: "2024-01-10",
      title: "The Power of Music",
      firstParagraph: "Music has the ability to evoke emotions, heal, and bring people together. From classical to pop, every genre has its unique power.",
      image: "https://fastly.picsum.photos/id/186/640/360.jpg?hmac=l3VrnwhvnGZc0uyO7YsHj2kcWDaPkYWQ36RqhmuDNCM",
      content: [
        Text(
          "Music is a universal language that transcends barriers. It has the power to connect people across cultures and backgrounds.",
        ),
        Headline(H2, "Music as Therapy"),
        Text(
          "Music therapy is used to treat a variety of conditions, from depression to Alzheimer's. It has the ability to soothe and heal.",
        ),
        Quote({
          quote: "Without music, life would be a mistake.",
          quotee: "Friedrich Nietzsche",
        }),
        Separator,
        Text(
          "Whether you're playing an instrument or just listening, music has the power to transform your mood and your day.",
        ),
      ],
    },
  ]
)

let getPosts = async () => posts

let getPost = async id => {
  posts->Array.find(post => post.id === id)
}

let findPosts = async query => {
  let lower = String.toLowerCase(query)

  switch lower {
  | "" => []
  | _ => posts->Array.filter(post => post.title->String.toLowerCase->String.includes(lower))
  }
}
