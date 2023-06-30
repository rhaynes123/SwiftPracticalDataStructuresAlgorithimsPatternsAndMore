# Unit Testing
Unit Testing is a simple enough concept. It involved writing code into your application that sends fake or mocked data into classes and methods that give ways to test our code before we push it to production without having to run the entire application which can be exhausting. 

One critical components of unit testing is the use of Protocols to support unit testing. Protocols give us the ability to replace fake instances of classes instead of real classes that need to do work. This will work well in our current app as the PostApp has a class intended to call an API but we don't want to do that when running code on for a lot of our automated tests otherwise we run the risk of hitting a real API.



```Swift
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
        XCTAssertNotEqual(firstPost.body, "")
    }

}

```
Lets break down the core components of what we see above. The first core part to discuss is that because of our interface we can make a Mock Post service and provide that to our PostsViewModel and it won't need t hit our real api to get data.

```Swift
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
```

```Swift
private var _sut : PostsViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        _sut = PostsViewModel(postService: MockPostService())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        _sut = nil
    }
```
We need make a few adjustments first creating a property for our test model which we are naming sut short for System Under Test. We then use the setup method to give it a value that will be shared for every test and then a teardown to clear it from memory when not needed anymore.

```Swift
unc testThatPostViewModelGetPosts() async throws {
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
```
Next to wrap things we up we write a few naive unit tests that test some of our use cases. First we have just making sure we are actually able to get data. Not super important in this use case since the data is mocked but still always worthh ensuring your code correctly calls a methd and returns data. The next two hopefully have well enough defined names that it is very clear what the do but the second makes sure we have no more than 20 posts and the laast just makes sure the first post has an actual body. Again these are all naive and better tests are needed if this was productions but this gets the idea across on the basics of unit testing.