//
//  Post.swift
//  PostsApp
//
//  Created by Andjela Mircetic on 12.6.25..
//

struct Post: Identifiable, Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
