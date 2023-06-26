//
//  TimeProvider.swift
//  Clock
//
//  Created by richard Haynes on 6/25/23.
//

import Foundation
protocol TimeProvider {
    func Update() -> (Hours: String, Minutes: String, Seconds: String)
}
extension TimeProvider  {
    func Update() -> (Hours: String, Minutes: String, Seconds: String) {
        let today = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: today)
        let minute = calendar.component(.minute, from: today)
        let second = calendar.component(.second, from: today)
        
        let hours = String(format: "%02d", hour)
        let minutes = String(format: "%02d", minute)
        let seconds = String(format: "%02d", second)
        
        return (hours, minutes, seconds)
    }
}
