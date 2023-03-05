//
//  MovieManager.swift
//  Spider-ManMoviesCatalog
//
//  Created by richard Haynes on 2/26/23.
// https://www.appypie.com/loops-swift-how-to
// https://medium.com/@vickykumaranand_46799/searching-in-swift-data-structure-7da227ed3eaf
import Foundation
struct MovieManager {
    private let allMovies : [Movie] = [
        Movie(title: "Spider-Man", releaseDate: "May 3, 2002", director: "Sam Raimi", imageString: "https://upload.wikimedia.org/wikipedia/en/f/f3/Spider-Man2002Poster.jpg"),
        Movie(title: "Spider-Man 2", releaseDate: "June 30, 2004", director: "Sam Raimi", imageString: "https://upload.wikimedia.org/wikipedia/en/0/02/Spider-Man_2_Poster.jpg"),
        Movie(title: "Spider-Man 3", releaseDate: "May 4, 2007", director: "Sam Raimi", imageString: "https://upload.wikimedia.org/wikipedia/en/7/7a/Spider-Man_3%2C_International_Poster.jpg"),
        Movie( title: "Amazing Spider-Man", releaseDate: "July 3, 2012", director: "Marc Webb", imageString: "https://upload.wikimedia.org/wikipedia/en/0/02/The_Amazing_Spider-Man_theatrical_poster.jpeg"),
        Movie(title: "Amazing Spider-Man 2", releaseDate: "May 2, 2014", director: "Marc Webb", imageString: "https://upload.wikimedia.org/wikipedia/en/0/02/The_Amazing_Spiderman_2_poster.jpg"),
        Movie(title: "Spider-Man: Homecoming", releaseDate: "June 28, 2017", director: "Jon Watts", imageString: "https://upload.wikimedia.org/wikipedia/en/f/f9/Spider-Man_Homecoming_poster.jpg"),
        Movie(title: "Spider-Man: Far From Home", releaseDate: "July 2, 2019", director: "Jon Watts", imageString: "https://upload.wikimedia.org/wikipedia/en/b/bd/Spider-Man_Far_From_Home_poster.jpg"),
        Movie(title: "Spider-Man: No Way Home", releaseDate: "December 13, 2021", director: "Jon Watts", imageString: "https://upload.wikimedia.org/wikipedia/en/0/00/Spider-Man_No_Way_Home_poster.jpg"),
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
