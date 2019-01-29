class Posts extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      error: null,
      isLoaded: false,
      posts: []
    };
  }

  componentDidMount() {
    fetch('/posts').
      then(res => res.json()).
      then(
        (result) => {
        this.setState({
          isLoaded: true,
          posts: result.posts
        });
      },
      (error) => {
        this.setState({
          isLoaded: true,
          error
        });
      }
    )
  }

  render() {
    const { error, isLoaded, posts } = this.state;
    if (error) {
      return <div>Error: {error.message}</div>;
    } else if(!isLoaded) {
      return <div>Loading...</div>;
    } else {
      return (
        <ul>
          {posts.map(post => (
            <li key={post.title}>
              {post.title}
              <p>{post.body}</p>
            </li>
          ))}
        </ul>
      );
    }
  }
}
