//
//  APIClient.swift
//  PostsApp
//
//  Created by Andjela Mircetic on 12.6.25..
//
import Foundation

protocol APIClient {
    func get<T: Decodable>(endpoint: String) async throws -> T
    func post<T: Decodable, U: Encodable>(endpoint: String, body: U) async throws -> T
}

class DefaultAPIClient: APIClient {
    private let baseURL = "https://jsonplaceholder.typicode.com"
    
    func get<T: Decodable>(endpoint: String) async throws -> T {
        guard let url = URL(string: baseURL + endpoint) else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    func post<T: Decodable, U: Encodable>(endpoint: String, body: U) async throws -> T {
        guard let url = URL(string: baseURL + endpoint) else {
            throw URLError(.badURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(body)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(T.self, from: data)
    }
}

