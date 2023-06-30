//
//  PostsService.swift
//  PostApp
//
//  Created by richard Haynes on 6/29/23.
//

import Foundation

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

