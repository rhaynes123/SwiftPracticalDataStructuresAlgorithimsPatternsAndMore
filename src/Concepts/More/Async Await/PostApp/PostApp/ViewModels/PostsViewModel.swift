//
//  PostsViewModel.swift
//  PostApp
//
//  Created by richard Haynes on 6/29/23.
//

import Foundation
final class PostsViewModel : ObservableObject {
    private var postsService : PostService = PostService()
    
    func getPosts () async throws -> [Post] {
        return try await postsService.getPosts()
    }
}
