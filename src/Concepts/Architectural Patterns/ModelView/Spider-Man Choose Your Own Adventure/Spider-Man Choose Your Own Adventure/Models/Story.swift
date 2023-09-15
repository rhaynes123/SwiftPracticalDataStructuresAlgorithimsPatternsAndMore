//
//  Story.swift
//  Spider-Man Choose Your Own Adventure
//
//  Created by richard Haynes on 9/13/23.
//

import Foundation

struct Story {
    
    let pages: [Page]


    subscript(_ pageNumber: Int) -> Page {
        return pages.first(where: {$0.number == pageNumber}) ?? pages[0]
    }
}


struct Page  {
    
    let text: String
    
    let number: Int
    
    let choices: [Choice]
    
    init(_ text: String, number: Int, choices: [Choice]) {
        self.text = text
        self.choices = choices
        self.number = number
    }
}


struct Choice {
    let text: String
    let destinationPage: Int
}

let previewStory = Story(pages: [
    Page(
                """
                Welcome To Choose Your Own Path a Spider-Man Story
                """,
                number: 1,
                choices: [
                    Choice(text: "Swing!", destinationPage: 0),
                    Choice(text: "Jump!", destinationPage: 0),
                    Choice(text: "Crawl!", destinationPage: 0),
                ]
    ),
])
