//
//  MainViewModel.swift
//  Spider-ManMoviesCatalog
//
//  Created by richard Haynes on 2/26/23.
//

import Foundation
final class MainViewModel: ObservableObject {
    private let manager = MovieManager()
    static let sampleMovie = Movie(id: UUID(), title: "NA", releaseDate: "Jan 1 0001", director: "NA")
    
    func getMovies() -> [Movie]{
        return manager.getAllMovies()
    }
    func findMovie(by id : UUID) -> Movie {
        guard let movie = manager.findMovie(by: id) else {
            return MainViewModel.sampleMovie
        }
        return movie
    }
}
