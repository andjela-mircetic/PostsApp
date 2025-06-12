//
//  DetailsScreen.swift
//  PostsApp
//
//  Created by Andjela Mircetic on 12.6.25..
//

import SwiftUI

struct DetailsScreen: View {
    @StateObject var viewModel: DetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                AsyncImage(url: URL(string: "https://picsum.photos/400/200")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                    } else {
                        Color.gray.frame(height: 200)
                    }
                }
                
                Text(viewModel.post.title)
                    .font(.title)
                    .bold()
                
                Text(viewModel.post.body)
                    .font(.body)
                
                Divider()
                
                Text("Comments")
                    .font(.headline)
                
                ForEach(viewModel.comments) { comment in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(comment.name)
                            .font(.subheadline)
                            .bold()
                        Text(comment.body)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
                }
            }
            .padding()
        }
        .navigationTitle("Post Details")
        .task {
            await viewModel.fetchComments()
        }
    }
}
