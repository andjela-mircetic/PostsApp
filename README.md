PostsApp is small app that displays lists of posts. When clicked on some post, user gets navigated to details screen of that post. 
On main screen, there is also button for navigating to screen that allows user to create new post.

The app uses a simple but scalable MVVM + Service + Router architecture with clear separation of concerns:

UI Layer (Views): PostListScreen, DetailsScreen, CreatePostScreen
ViewModels: PostsListViewModel, CreatePostViewModel, DetailsViewModel
Domain Models: Post, Comment

For networking layer there is APIClient protocol, and DefaultAPIClient implementation. Protocol is used for better mocking and testability.

PostService is responsible for fetching posts, comments and creating posts, directly communicating with network layer.

For routing custom enum MainRouter was used to handle navigation programmatically.
