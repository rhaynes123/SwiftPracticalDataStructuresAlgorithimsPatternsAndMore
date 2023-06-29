//
//  PostsService.swift
//  PostApp
//
//  Created by richard Haynes on 6/29/23.
//

import Foundation
struct PostService {
    
    enum PostServiceError : Error {
        case failed, failedToDecode,invalidStatusCode
    }
    
    private var postUrlString = "https://jsonplaceholder.typicode.com/posts"
    
    func getPosts() async throws -> [Post]{
        let url = URL(string: postUrlString)!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw PostServiceError.invalidStatusCode
        }
        
        let decodedPostData = try JSONDecoder().decode([Post].self, from: data)
        
        return decodedPostData
    }
}
