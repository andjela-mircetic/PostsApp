//
//  DetailsScreenViewModel.swift
//  PostsApp
//
//  Created by Andjela Mircetic on 12.6.25..
//

import Foundation

@MainActor
class DetailsViewModel: ObservableObject {
    @Published var post: Post
    @Published var comments: [Comment] = []
    
    private let service: PostService
    
    init(post: Post, service: PostService) {
        self.post = post
        self.service = service
    }
    
    func fetchComments() async {
        do {
            let fetchedComments = try await service.fetchComments(postId: post.id)
            self.comments = Array(fetchedComments.prefix(3))
        } catch {
            print("Failed to fetch comments: \(error)")
        }
    }
}
