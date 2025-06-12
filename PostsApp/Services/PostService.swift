//
//  PostService.swift
//  PostsApp
//
//  Created by Andjela Mircetic on 12.6.25..
//

class PostService {
    private let client: APIClient
    
    init(client: APIClient) {
        self.client = client
    }
    
    func fetchPosts() async throws -> [Post] {
        try await client.get(endpoint: "/posts")
    }
    
    func fetchComments(postId: Int) async throws -> [Comment] {
        try await client.get(endpoint: "/posts/\(postId)/comments")
    }
    
    func createPost(post: Post) async throws -> Post {
        try await client.post(endpoint: "/posts", body: post)
    }
}
