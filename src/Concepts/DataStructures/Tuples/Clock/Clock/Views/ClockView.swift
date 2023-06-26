//
//  ClockView.swift
//  Clock
//
//  Created by richard Haynes on 6/25/23.
//

import SwiftUI
struct ClockView: View {
    @ObservedObject var model: ClockViewModel
    
    var body: some View {
        HStack {
            Text(model.hours)
            Text(":")
            Text(model.minutes)
            Text(":")
            Text(model.seconds)
        }
        .font(.largeTitle)
        .monospacedDigit()
    }
}
