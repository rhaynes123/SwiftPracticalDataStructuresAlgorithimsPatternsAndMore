//
//  ContentView.swift
//  PostApp
//
//  Created by richard Haynes on 6/29/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var model : PostsViewModel = PostsViewModel(postService: PostService())
    
    @State private var displayAlert = false
    @State private var errorMessage = ""
    @State private var posts : [Post] = []
    
    var body: some View {
        NavigationStack {
            Form {
                ForEach(posts) { post in
                    NavigationLink {
                        Text(post.title)
                            .font(.largeTitle)
                        Text(post.body)
                        
                            .font(.body)
                    } label: {
                        Text("Post #\(post.id): \(post.title)")
                    }
                    
                }
            }.navigationTitle("Top 20 Posts")
        }.onAppear {
            Task {
                do {
                    posts = try await model.getPosts()
                }
                catch let error as PostServiceError {
                    displayAlert = true
                    errorMessage = error.text
                    print(error)
                }
                catch {
                    displayAlert = true
                    print(error)
                }
            }
        }.padding()
            .alert(isPresented: $displayAlert){
                        Alert(title: Text("Ooops Something Went Wrong"),
                            message: Text("\(errorMessage) Close and Re-Open the App to See If the Issues Continues"))
                    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
