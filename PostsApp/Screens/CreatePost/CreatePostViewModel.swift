//
//  CreatePostViewModel.swift
//  PostsApp
//
//  Created by Andjela Mircetic on 12.6.25..
//

import Foundation

@MainActor
class CreatePostViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var body: String = ""
    @Published var isSubmitting: Bool = false
    @Published var submissionSuccess: Bool = false
    
    private let service: PostService
    
    init(service: PostService) {
        self.service = service
    }
    
    func submitPost() async {
        isSubmitting = true
        defer { isSubmitting = false }
        
        let newPost = Post(id: 0, userId: 1, title: title, body: body)
        do {
            let createdPost = try await service.createPost(post: newPost)
            print("Created post: \(createdPost)")
            submissionSuccess = true
        } catch {
            print("Failed to create post: \(error)")
        }
    }
}
