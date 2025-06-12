//
//  CreatePostScreen.swift
//  PostsApp
//
//  Created by Andjela Mircetic on 12.6.25..
//

import SwiftUI

struct CreatePostScreen: View {
    
    struct Constants {
        static let mainSpacing: CGFloat = 24
        static let fieldSpacing: CGFloat = 8
        static let textEditorHeight: CGFloat = 150
        static let cornerRadius: CGFloat = 8
        static let buttonCornerRadius: CGFloat = 10
        static let buttonPadding: CGFloat = 16
        static let mainPadding: CGFloat = 16
    }
    
    @StateObject var viewModel: CreatePostViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: Constants.mainSpacing) {
            
            VStack(alignment: .leading, spacing: Constants.fieldSpacing) {
                Text("Title")
                    .font(.headline)
                TextField("Enter title", text: $viewModel.title)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(Constants.cornerRadius)
            }
            
            VStack(alignment: .leading, spacing: Constants.fieldSpacing) {
                Text("Body")
                    .font(.headline)
                TextEditor(text: $viewModel.body)
                    .frame(height: Constants.textEditorHeight)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(Constants.cornerRadius)
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
                        .padding(Constants.buttonPadding)
                        .background((viewModel.title.isEmpty || viewModel.body.isEmpty) ? Color.gray : Color.blue)
                        .cornerRadius(Constants.buttonCornerRadius)
                }
            }
            .disabled(viewModel.title.isEmpty || viewModel.body.isEmpty)
            
        }
        .padding(Constants.mainPadding)
        .navigationTitle("Create Post")
    }
}
