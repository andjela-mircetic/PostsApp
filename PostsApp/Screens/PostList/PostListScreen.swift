//
//  PostListScreen.swift
//  PostsApp
//
//  Created by Andjela Mircetic on 12.6.25..
//

import SwiftUI

struct PostListScreen: View {
    @StateObject var viewModel: PostsListViewModel
    @State private var route: MainRouter?

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.posts) { post in
                            PostView(post: post)
                                .onTapGesture {
                                    route = .details(post)
                                }
                                .padding(.horizontal)
                        }
                    }
                    .padding(.top)
                }
            }
            .navigationTitle("Posts")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Create Post") {
                        route = .create
                    }
                }
            }
            .task {
                await viewModel.fetchPosts()
            }
            .background(
                NavigationLink(
                    destination: destinationView(),
                    isActive: Binding<Bool>(
                        get: { route != nil },
                        set: { if !$0 { route = nil } }
                    )
                ) {
                    EmptyView()
                }
            )
        }
    }

    @ViewBuilder
    private func destinationView() -> some View {
        switch route {
        case .details(let post):
            DetailsScreen(viewModel: DetailsViewModel(post: post, service: viewModel.getService()))
        case .create:
            CreatePostScreen(viewModel: CreatePostViewModel(service: viewModel.getService()))
        case .none:
            EmptyView()
        }
    }
}
