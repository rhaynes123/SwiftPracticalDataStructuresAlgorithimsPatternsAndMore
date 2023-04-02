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
            VisitsView().environment(\.managedObjectContext, PersistenceProvider.preview.container.viewContext)
        }
    }
}
