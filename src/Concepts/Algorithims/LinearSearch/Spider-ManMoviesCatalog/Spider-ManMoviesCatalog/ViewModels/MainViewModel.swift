//
//  MainViewModel.swift
//  Spider-ManMoviesCatalog
//
//  Created by richard Haynes on 2/26/23.
// https://www.hackingwithswift.com/quick-start/swiftui/displaying-a-detail-screen-with-navigationlink

import Foundation
final class MainViewModel: ObservableObject {
    private let manager = MovieManager()
    static let sampleMovie = Movie(title: "NA", releaseDate: "Jan 1 0001", director: "NA", imageString: "NA")
    
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
