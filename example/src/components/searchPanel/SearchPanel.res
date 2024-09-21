let make = Component.make(async _ => {
  // TODO: remove it
  let posts = await API.getPosts()

  <search-panel>
    <dialog>
      <div class="inner">
        <div class="searchBar">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            strokeWidth="2"
            strokeLinecap="round"
            strokeLinejoin="round"
            class="lucide lucide-search">
            <circle cx="11" cy="11" r="8" />
            <path d="m21 21-4.3-4.3" />
          </svg>
          <input autoFocus={true} placeholder="Search" />
          <button tabIndex={-1}>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="24"
              height="24"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              strokeWidth="2"
              strokeLinecap="round"
              strokeLinejoin="round"
              class="lucide lucide-circle-x">
              <circle cx="12" cy="12" r="10" />
              <path d="m15 9-6 6" />
              <path d="m9 9 6 6" />
            </svg>
          </button>
        </div>
        <ul>
          {posts
          ->Array.map(post =>
            <li>
              <a href={`/blog/posts/${post.id}`}> {Jsx.string(post.title)} </a>
            </li>
          )
          ->Jsx.array}
        </ul>
      </div>
    </dialog>
  </search-panel>
})
