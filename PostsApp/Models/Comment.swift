//
//  Comment.swift
//  PostsApp
//
//  Created by Andjela Mircetic on 12.6.25..
//

struct Comment: Identifiable, Codable {
    let id: Int
    let postId: Int
    let name: String
    let email: String
    let body: String
}
