//
//  PostViewModelTestCases.swift
//  PostAppTests
//
//  Created by richard Haynes on 6/29/23.
//
// https://paul-samuels.com/blog/2019/01/07/swift-codable-testing/
// https://jsonplaceholder.typicode.com/posts
// https://levelup.gitconnected.com/quick-start-writing-unit-tests-in-xcode-4655b644c770
// https://www.youtube.com/watch?v=opkU2UuPk0A&t=17s
import XCTest
@testable import PostApp
final class PostViewModelTestCases: XCTestCase {
    
    final class MockPostService: PostServiceProtocol {
        func getPosts() async throws -> [PostApp.Post] {
            
            let data = Data("""
                   [
                    {
                        "userId": 1,
                        "id": 3000,
                        "title": "Mock Title",
                        "body": "Mock Body"
                    }
                    ]
""".utf8)
            let decodedPostData = try JSONDecoder().decode([Post].self, from: data)
            return decodedPostData
        }
    }
    
    private var _sut : PostsViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        _sut = PostsViewModel(postService: MockPostService())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        _sut = nil
    }

  
    func testThatPostViewModelGetPosts() async throws {
        let testPosts = try await _sut.getPosts()
        XCTAssertGreaterThan(testPosts.count, 0)
    }
    
    func testThatPostViewModelGetPostsDoesNotReturnMoreThan20Posts() async throws {
        let testPosts = try await _sut.getPosts()
        XCTAssertLessThanOrEqual(testPosts.count, 20)
    }
    
    func testThatPostHasABody() async throws {
        let testPosts = try await _sut.getPosts()
        let firstPost = testPosts[0]
        XCTAssertEqual(firstPost.body, "Mock Body")
    }

}
