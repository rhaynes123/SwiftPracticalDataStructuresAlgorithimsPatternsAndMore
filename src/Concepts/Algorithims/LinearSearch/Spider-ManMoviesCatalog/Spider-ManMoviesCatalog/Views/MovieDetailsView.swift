//
//  MovieDetailsView.swift
//  Spider-ManMoviesCatalog
//
//  Created by richard Haynes on 2/26/23.
//

import SwiftUI

struct MovieDetailsView: View {
    @EnvironmentObject var mainViewModel : MainViewModel
    @State private var movie : Movie = MainViewModel.sampleMovie
    let movieId: UUID
    var body: some View {
        VStack(spacing: 10){
            Text("**Title** \(movie.title)")
            Text("**Director** \(movie.director)")
            Text("**ReleaseDate** \(movie.releaseDate)")
        }.onAppear{
            movie = mainViewModel.findMovie(by: movieId)
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movieId: UUID())
            .environmentObject(MainViewModel())
    }
}
