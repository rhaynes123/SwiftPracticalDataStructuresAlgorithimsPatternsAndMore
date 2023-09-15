//
//  Aventure.swift
//  Spider-Man Choose Your Own Adventure
//
//  Created by richard Haynes on 9/13/23.
//

import Foundation
final class Adventure {
    var story: Story = previewStory
    static let preview = Adventure()
    
    fileprivate init() {
        // This is only to be used for the preview
    }
}
