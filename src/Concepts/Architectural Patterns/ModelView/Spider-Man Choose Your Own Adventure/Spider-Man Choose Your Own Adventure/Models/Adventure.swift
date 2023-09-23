//
//  Aventure.swift
//  Spider-Man Choose Your Own Adventure
//
//  Created by richard Haynes on 9/13/23.
//

import Foundation
final class Adventure {
    var story: Story = previewStory
    static let preview = Adventure(story:previewStory)
    
    init(story: Story) {
        self.story = story
    }
}

let mainStory = Story(pages: [
    Page(
                """
                Welcome To Choose Your Own Path a Spider-Man Story
                """,
                number: 1,
                choices: [
                    Choice(text: "Swing!", destinationPage: 2),
                    Choice(text: "Jump!", destinationPage: 3),
                    Choice(text: "Crawl!", destinationPage: 4),
                ]
    ),
    Page(
                """
                You use you trusty web shooter to make a web line and swing through the air ready to fight crime!
                """,
                number: 2,
                choices: [
                    Choice(text: "Replay!", destinationPage: 1)
                ]
    ),
    Page(
                """
                You leap high into the air like a jumping spider and spin with amazing grace showing yourself as the Amazing Spider-Man!
                """,
                number: 3,
                choices: [
                    Choice(text: "Replay!", destinationPage: 1)
                ]
    ),
    Page(
                """
                You crawl up the side of a wall like the human spider you are!
                """,
                number: 4,
                choices: [
                    Choice(text: "Replay!", destinationPage: 1)
                ]
    ),
])
