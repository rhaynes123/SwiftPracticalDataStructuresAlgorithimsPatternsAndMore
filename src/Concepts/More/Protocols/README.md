# Protocols
A protocol is a type in Swift like a class or struct however it differs from those custom types in that it can only contain a siginature for a method and not its implementations. Protocols are often used as a way to ensure that a class or struct conforms to series or rules in regards to properties or functions a custom type must contain be provides freedom to the custom type to not implement them the same way.

## Unit testing
In modern programming one of the main use cases for Protocols (there are many) is to support unit testing. In many ways most forms of OOP would be impossible with the use of Protocols.

```Swift
protocol ServiceProtocol {
    func getData() async throws -> [Post]
}

struct PostService : ServiceProtocol {
    private var postUrlString = "https://jsonplaceholder.typicode.com/posts"
    
    func getData() async throws -> [Post]{
        let url = URL(string: postUrlString)!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw PostServiceError.invalidStatusCode
        }
        do {
            let decodedPostData = try JSONDecoder().decode([Post].self, from: data)
            return decodedPostData
        }
        catch {
            throw PostServiceError.failedToDecode
        }
    }
}
```

So above I have a protocol called ServiceProtocol and struct called PostService that conforms to that protocol. I only gave this protocol one method for fetching data so that is the only one that has to be implemented by the PostService of course it could have more.

That protocol is used in a ViewModel called PostsViewModel and it's call definition nows only that it needs a type that conforms to that protocol which I can create a new instance of when I want a spefic implementation.

```Swift
import Foundation
final class PostsViewModel : ObservableObject {
    private var postsService : ServiceProtocol
    
    init(postService : ServiceProtocol){
        postsService = postService
    }
    
    func getPosts () async throws -> [Post] {
        let posts = try await postsService.getData()
        return Array(posts.prefix(20))
    }
}
```
In fact that PostService is only newed up inside the ContentView.
```Swift
import SwiftUI

struct ContentView: View {
    @StateObject private var model : PostsViewModel = PostsViewModel(postService: PostService())
    
    @State private var displayAlert = false
    @State private var errorMessage = ""
    @State private var posts : [Post] = []
```
Now below I've shown you a class in a Unit test called MockPostService this PostService getData method. As you can see its not making a real network call but is just returning hard coded data.

```Swift
final class MockPostService: ServiceProtocol {
        func getData() async throws -> [PostApp.Post] {
            
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
I can use a few Unit testing methods to control which service I pass to an instance of the PostsViewModel.
```Swift
 private var _sut : PostsViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        _sut = PostsViewModel(postService: MockPostService())
    }
```
And now I can write code that actually tests other pieces of code without testing ever component or user interface in my app.

```Swift
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
```