//
//  PostsViewModel.swift
//  PostApp
//
//  Created by richard Haynes on 6/29/23.
//

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
