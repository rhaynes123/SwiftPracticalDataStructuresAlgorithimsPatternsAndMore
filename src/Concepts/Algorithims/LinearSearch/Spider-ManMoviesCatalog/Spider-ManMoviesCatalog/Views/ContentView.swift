//
//  ContentView.swift
//  Spider-ManMoviesCatalog
//
//  Created by richard Haynes on 2/26/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var model = MainViewModel()
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(model.getMovies(), id: \.id){ movie in
                    NavigationLink(destination:MovieDetailsView(movieId: movie.id)){
                        Text(movie.title)
                    }
                }
            }.navigationTitle("Spider-Man Movies")
        }
        .environmentObject(model)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
