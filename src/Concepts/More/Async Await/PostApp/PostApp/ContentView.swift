//
//  ContentView.swift
//  PostApp
//
//  Created by richard Haynes on 6/29/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var model : PostsViewModel = PostsViewModel()
    
    @State private var posts : [Post] = []
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(posts) { post in
                    NavigationLink {
                        Text(post.body)
                    } label: {
                        Text(post.title)
                    }
                    
                }
            }.navigationTitle("Posts")
        }.onAppear {
            Task {
                posts = try await model.getPosts()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
