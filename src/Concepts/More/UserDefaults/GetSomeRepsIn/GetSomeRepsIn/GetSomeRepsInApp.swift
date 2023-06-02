//
//  GetSomeRepsInApp.swift
//  GetSomeRepsIn
//
//  Created by richard Haynes on 5/6/23.
//

import SwiftUI

@main
struct GetSomeRepsInApp: App {
    var body: some Scene {
        WindowGroup {
            MainViewTabView().environment(\.managedObjectContext, PersistenceProvider.shared.container.viewContext)
        }
    }
}
