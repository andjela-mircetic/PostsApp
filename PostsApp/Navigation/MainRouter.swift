//
//  MainRouter.swift
//  PostsApp
//
//  Created by Andjela Mircetic on 12.6.25..
//

enum MainRouter: Identifiable {
    case details(Post)
    case create
    
    var id: String {
        switch self {
        case .details(let post): return "details-\(post.id)"
        case .create: return "create"
        }
    }
}
