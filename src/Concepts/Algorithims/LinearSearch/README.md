# Linear Search
A linear search is one of the most basic searching algorithims. It's one the basic's because the algorithim will search an entire collection looking for a single item that meets a particularly identified search criteria. The simplicity of the algorithim is both it's pro and con when compared to other search algorithims, because it will loop over an entire collection until the item searching for is found and if it's not found a non-valid item must be returned. In the older C or C++ the algorithim would return the index of the item and return a -1 if the item wasn't found but in this situation we will return the object being searched for itself or nil if not found.

## MovieManager.swift

```swift

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

```
So if we examine the above lines of code we can see that there is a hard code list of Spider-Man movies. In a production level app a list like this is better populated by either an API or potentially even database, but for the sake of this example this is how we will store our list of movies. 

Our MovieManager class will be responsible for "managing" how our data is accessed. We have 2 methods for gathering data, the first is simply getAllMovies which returns all the movies from our list.

The second one is the main focus point of this example. In our example below we are using a simple for loop and looping over every movie in our list. In swift this particular type of for loop is referred to a for-in loop its not exclusive to swift Javascript also has loops of the same nature for example. Something else that Swift does that deviants a bit from other examples of this algorithim is that swift has a built in where clause keyword to be attached to for loops and is useful for filtering any collection. 

```swift

func findMovie(by id : UUID) -> Movie? {
        for movie in self.allMovies where movie.id == id {
            return movie
        }
        return nil
    }
    
```
**OPINION**: So I would like to stress that regardless of the pros and cons for a linear search this is my favorite search algorithim because of its simplicity in relation to speed. It's speed is dependendant on the size of the collection which is true but there are a number of programming practices and techniques that should focus on restricting the amount of data gathered before any search algorithim is applied period. This applies to both database and especially API network calls. Those are fair more critical to be done correctly that in many situations a linear search works just fine as the data being searched is the barest minimun needed anyway.