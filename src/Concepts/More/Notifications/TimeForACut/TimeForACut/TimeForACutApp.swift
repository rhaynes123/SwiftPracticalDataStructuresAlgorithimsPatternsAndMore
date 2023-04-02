//
//  TimeForACutApp.swift
//  TimeForACut
//
//  Created by richard Haynes on 3/29/23.
//

import SwiftUI

@main
struct TimeForACutApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, PersistenceProvider.shared.container.viewContext)
        }
    }
}
