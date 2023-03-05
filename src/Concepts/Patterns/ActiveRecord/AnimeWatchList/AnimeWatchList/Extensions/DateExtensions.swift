//
//  DateExtensions.swift
//  AnimeWatchList
//
//  Created by richard Haynes on 3/4/23.
//
// https://cocoacasts.com/swift-fundamentals-how-to-convert-a-date-to-a-string-in-swift
import Foundation

extension Date? {
    
    func toString() -> String {
        let dateFormatter : DateFormatter = getFormatter()
        guard let date = self else{
            return ""
        }
        return dateFormatter.string(from: date)
    }
    
    func fromString(from inputValue: String) -> Date? {
        let dateFormatter : DateFormatter = getFormatter()
        return dateFormatter.date(from: inputValue)
    }
    
    private func getFormatter() -> DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }
}
