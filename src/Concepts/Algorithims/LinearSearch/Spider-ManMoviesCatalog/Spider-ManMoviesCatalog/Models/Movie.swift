//
//  Movie.swift
//  Spider-ManMoviesCatalog
//
//  Created by richard Haynes on 2/26/23.
//

import Foundation
struct Movie : Identifiable {
    let id: UUID = UUID()
    let title: String
    let releaseDate : String
    let director: String
    let imageString: String
}
