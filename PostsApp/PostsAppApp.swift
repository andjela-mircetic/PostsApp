//
//  PostsAppApp.swift
//  PostsApp
//
//  Created by Andjela Mircetic on 12.6.25..
//

import SwiftUI

@main
struct PostsAppApp: App {
    private let postService = PostService(client: DefaultAPIClient())
    
    var body: some Scene {
        WindowGroup {
            PostListScreen(viewModel: PostsListViewModel(service: postService))
        }
    }
}
