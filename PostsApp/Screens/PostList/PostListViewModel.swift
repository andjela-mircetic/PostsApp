//
//  PostListViewModel.swift
//  PostsApp
//
//  Created by Andjela Mircetic on 12.6.25..
//

import Foundation

@MainActor
class PostsListViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    private let service: PostService
    
    init(service: PostService) {
        self.service = service
    }
    
    func fetchPosts() async {
        do {
            let fetchedPosts = try await service.fetchPosts()
            self.posts = fetchedPosts
        } catch {
            print("Failed to fetch posts: \(error)")
        }
    }
    
    func getService() -> PostService {
        return service
    }
}
