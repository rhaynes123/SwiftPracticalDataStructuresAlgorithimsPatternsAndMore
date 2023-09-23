//
//  AddDreamIntent.swift
//  DreamJournal
//
//  Created by richard Haynes on 9/23/23.
//

import Foundation
import AppIntents
import SwiftData

struct AddDreamIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Log Dream"
    
    @Parameter(title: "Note")
    var note: String
    @Parameter(title: "Date")
    var date: Date
    
    init(note: String, date: Date) {
        self.note = note
        self.date = date
    }
    
    init() {
        self.note = "None"
    }
    @MainActor
    func perform() async throws -> some IntentResult {
        guard let modelContext = try? ModelContainer(for: Dream.self).mainContext else {
            return .result()
        }
        let dream = Dream(note: note, dateTime: date)
        modelContext.insert(dream)
        return .result()
    }
    
}
