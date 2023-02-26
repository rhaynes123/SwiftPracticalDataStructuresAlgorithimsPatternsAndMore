//
//  MovieManager.swift
//  Spider-ManMoviesCatalog
//
//  Created by richard Haynes on 2/26/23.
//
// https://medium.com/@vickykumaranand_46799/searching-in-swift-data-structure-7da227ed3eaf
import Foundation
struct MovieManager {
    private let allMovies : [Movie] = [
        Movie(id: UUID(), title: "Spider-Man", releaseDate: "May 3, 2002", director: "Sam Raimi"),
        Movie(id: UUID(), title: "Spider-Man 2", releaseDate: "June 30, 2004", director: "Sam Raimi"),
        Movie(id: UUID(), title: "Spider-Man 3", releaseDate: "May 4, 2007", director: "Sam Raimi")
    ]
    func getAllMovies() -> [Movie]{
        return self.allMovies
    }
    
    // This is our function that is going to loop over every movie and return the movie it finds that matches our criteria or return nil
    func findMovie(by id : UUID) -> Movie? {
        for movie in self.allMovies where movie.id == id {
            return movie
        }
        return nil
    }
}
