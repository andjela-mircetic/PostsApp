//
//  PostView.swift
//  PostsApp
//
//  Created by Andjela Mircetic on 12.6.25..
//

import SwiftUI

struct PostView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(post.title)
                .font(.subheadline)
            Text(post.body)
                .font(.body)
                .foregroundColor(.secondary)
        }
        .frame(width: 320)
        .padding()
        .background(Color(UIColor.gray))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}
