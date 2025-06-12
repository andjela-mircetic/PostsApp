//
//  CreatePostScreen.swift
//  PostsApp
//
//  Created by Andjela Mircetic on 12.6.25..
//

import SwiftUI

struct CreatePostScreen: View {
    @StateObject var viewModel: CreatePostViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Title")
                    .font(.headline)
                TextField("Enter title", text: $viewModel.title)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(8)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Body")
                    .font(.headline)
                TextEditor(text: $viewModel.body)
                    .frame(height: 150)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(8)
            }
            
            Spacer()
            
            Button(action: {
                Task {
                    await viewModel.submitPost()
                    if viewModel.submissionSuccess {
                        dismiss()
                    }
                }
            }) {
                if viewModel.isSubmitting {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                } else {
                    Text("Submit")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background((viewModel.title.isEmpty || viewModel.body.isEmpty) ? Color.gray : Color.blue)
                        .cornerRadius(10)
                }
            }
            .disabled(viewModel.title.isEmpty || viewModel.body.isEmpty)
            
        }
        .padding()
        .navigationTitle("Create Post")
    }
}
