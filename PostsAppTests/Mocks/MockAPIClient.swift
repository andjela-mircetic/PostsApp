//
//  MockAPIClient.swift
//  PostsApp
//
//  Created by Andjela Mircetic on 12.6.25..
//

import Foundation
@testable import PostsApp

class MockAPIClient: APIClient {
    
    var mockGetResult: Any?
    var mockPostResult: Any?
    
    func get<T>(endpoint: String) async throws -> T where T : Decodable {
        if let result = mockGetResult as? T {
            return result
        } else {
            throw URLError(.badServerResponse)
        }
    }
    
    func post<T, U>(endpoint: String, body: U) async throws -> T where T : Decodable, U : Encodable {
        if let result = mockPostResult as? T {
            return result
        } else {
            throw URLError(.badServerResponse)
        }
    }
}
