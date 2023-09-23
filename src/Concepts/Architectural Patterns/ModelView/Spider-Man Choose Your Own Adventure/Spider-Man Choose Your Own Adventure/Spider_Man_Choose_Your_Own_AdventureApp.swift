//
//  Spider_Man_Choose_Your_Own_AdventureApp.swift
//  Spider-Man Choose Your Own Adventure
//
//  Created by richard Haynes on 9/13/23.
//

import SwiftUI

@main
struct Spider_Man_Choose_Your_Own_AdventureApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
