//
//  DetailsScreen.swift
//  PostsApp
//
//  Created by Andjela Mircetic on 12.6.25..
//

import SwiftUI

struct DetailsScreen: View {
    
    struct Constants {
        static let imagePlaceholderSize: CGFloat = 200
        static let imageUrl: String = "https://picsum.photos/400/200"
        static let imageCornerRadius: CGFloat = 10
        static let spacingMain: CGFloat = 16
        static let spacingComment: CGFloat = 8
        static let commentVerticalPadding: CGFloat = 4
        static let mainPadding: CGFloat = 16
    }
    
    @StateObject var viewModel: DetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Constants.spacingMain) {
                
                AsyncImage(url: URL(string: Constants.imageUrl)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(Constants.imageCornerRadius)
                    } else {
                        Color.gray.frame(height: Constants.imagePlaceholderSize)
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
                    VStack(alignment: .leading, spacing: Constants.spacingComment) {
                        Text(comment.name)
                            .font(.subheadline)
                            .bold()
                        Text(comment.body)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, Constants.commentVerticalPadding)
                }
            }
            .padding(Constants.mainPadding)
        }
        .navigationTitle("Post Details")
        .task {
            await viewModel.fetchComments()
        }
    }
}
