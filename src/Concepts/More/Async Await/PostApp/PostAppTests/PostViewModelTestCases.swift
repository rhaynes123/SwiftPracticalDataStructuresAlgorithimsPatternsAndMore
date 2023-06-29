//
//  PostViewModelTestCases.swift
//  PostAppTests
//
//  Created by richard Haynes on 6/29/23.
//

import XCTest
@testable import PostApp
final class PostViewModelTestCases: XCTestCase {
    
    final class MockPostService: PostServiceProtocol {
        func getPosts() async throws -> [PostApp.Post] {
            
            let data = Data("""
                   [
                    {
                        "userId": 1,
                        "id": 3,
                        "title": "",
                        "body": ""
                    }
                    ]
""".utf8)
            let decodedPostData = try JSONDecoder().decode([Post].self, from: data)
            return decodedPostData
        }
    }
    
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testThatPostViewModelGetPosts() async throws {
        var _sut = PostsViewModel(postService: MockPostService())
        var testPosts = try await _sut.getPosts()
        XCTAssertEqual(testPosts.count, 1)
    }

}
