//
//  DeleteDreamIntent.swift
//  DreamJournal
//
//  Created by richard Haynes on 9/23/23.
//

import Foundation

import AppIntents
import SwiftData
struct DeleteDreamIntent : AppIntent {
    
    static var title: LocalizedStringResource = "Remove Dream"
    
    var offsets: IndexSet
    var dreams : [Dream]
    var context: ModelContext?
    
    init(offsets: IndexSet, dreams : [Dream], context: ModelContext) {
        self.offsets = offsets
        self.dreams = dreams
        self.context = context
    }
    
    init() {
        self.offsets = []
        self.dreams = []
        self.context = nil
    }
    
    @MainActor
    func perform() async throws -> some IntentResult {
        guard let modelContext = self.context else {
            return .result()
        }
        for index in offsets {
            modelContext.delete(dreams[index])
        }
        return .result()
    }
}
