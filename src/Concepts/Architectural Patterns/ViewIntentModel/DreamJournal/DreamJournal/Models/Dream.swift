//
//  Dream.swift
//  DreamJournal
//
//  Created by richard Haynes on 9/23/23.
//

import Foundation
import SwiftData
@Model
final class Dream {
    var note : String
    var dateTime : Date
    
    init(note: String, dateTime: Date) {
        self.note = note
        self.dateTime = dateTime
    }
}
