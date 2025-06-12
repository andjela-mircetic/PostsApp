//
//  PostsAppTests.swift
//  PostsAppTests
//
//  Created by Andjela Mircetic on 12.6.25..
//

import XCTest
@testable import PostsApp

final class PostServiceTests: XCTestCase {
    
    func testFetchPostsSuccess() async throws {
        let mockClient = MockAPIClient()
        let expectedPosts = [
            Post(id: 1, userId: 1, title: "Test Title", body: "Test Body")
        ]
        mockClient.mockGetResult = expectedPosts
        
        let service = PostService(client: mockClient)

        let posts = try await service.fetchPosts()

        XCTAssertEqual(posts.count, 1)
        XCTAssertEqual(posts.first?.title, "Test Title")
    }
    
    func testCreatePostSuccess() async throws {
        let mockClient = MockAPIClient()
        let post = Post(id: 101, userId: 1, title: "New Post", body: "Some new body")
        mockClient.mockPostResult = post
        
        let service = PostService(client: mockClient)
        
        let createdPost = try await service.createPost(post: post)
        
        XCTAssertEqual(createdPost.id, 101)
    }
    
    func testFetchCommentsSuccess() async throws {
        let mockClient = MockAPIClient()
        let expectedComments = [
            Comment(id: 1, postId: 1, name: "Test User", email: "test@example.com", body: "Some new comment")
        ]
        mockClient.mockGetResult = expectedComments
        
        let service = PostService(client: mockClient)
        let comments = try await service.fetchComments(postId: 1)
        
        XCTAssertEqual(comments.count, 1)
        XCTAssertEqual(comments.first?.name, "Test User")
    }
    
    func testFetchPostsFailure() async {
        let mockClient = MockAPIClient()
        mockClient.mockGetResult = nil
        
        let service = PostService(client: mockClient)
        
        do {
            _ = try await service.fetchPosts()
            XCTFail("Expected fetchPosts to throw an error but it succeeded")
        } catch {
            XCTAssertTrue(error is URLError)
        }
    }

    func testCreatePostFailure() async {
        let mockClient = MockAPIClient()
        mockClient.mockPostResult = nil
        
        let service = PostService(client: mockClient)
        
        do {
            let post = Post(id: 0, userId: 0, title: "", body: "")
            _ = try await service.createPost(post: post)
            XCTFail("Expected createPost to throw an error but it succeeded")
        } catch {
            XCTAssertTrue(error is URLError)
        }
    }
    
    func testFetchCommentsFailure() async {
        let mockClient = MockAPIClient()
        mockClient.mockGetResult = nil
        
        let service = PostService(client: mockClient)
        
        do {
            _ = try await service.fetchComments(postId: 1)
            XCTFail("Expected fetchComments to throw an error but it succeeded")
        } catch {
            XCTAssertTrue(error is URLError)
        }
    }
}
