//
//  DreamJournalApp.swift
//  DreamJournal
//
//  Created by richard Haynes on 9/23/23.
//

import SwiftUI
import SwiftData

@main
struct DreamJournalApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Dream.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(sharedModelContainer)
    }
}
