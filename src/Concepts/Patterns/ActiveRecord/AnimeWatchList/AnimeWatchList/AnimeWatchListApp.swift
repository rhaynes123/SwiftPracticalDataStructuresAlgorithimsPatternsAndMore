//
//  AnimeWatchListApp.swift
//  AnimeWatchList
//
//  Created by richard Haynes on 3/4/23.
//

import SwiftUI

@main
struct AnimeWatchListApp: App {
    let persistenceController = PersistenceProvider.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
