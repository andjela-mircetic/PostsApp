# PostsApp

PostsApp is small app that displays lists of posts. When clicked on some post, user gets navigated to details screen of that post.  
On main screen, there is also button for navigating to screen that allows user to create new post.

## Architecture

The app uses a simple but scalable **MVVM + Service + Router** architecture with clear separation of concerns:

### UI Layer (Views)

- `PostListScreen`
- `DetailsScreen`
- `CreatePostScreen`

### ViewModels

- `PostListViewModel`
- `CreatePostViewModel`
- `DetailsScreenViewModel`

### Domain Models

- `Post`
- `Comment`

## Networking Layer

- `APIClient` protocol
- `DefaultAPIClient` implementation  
- Protocol is used for better mocking and testability.

## Service Layer

- `PostService` is responsible for fetching posts, comments and creating posts, directly communicating with network layer.

## Routing

- For routing custom enum `MainRouter` was used to handle navigation programmatically.

## Unit Testing

- The service layer (`PostService`) is fully unit-tested.
- `MockAPIClient` is used to mock network responses.
- Tests cover both successful and failure scenarios.
