//
//  ContentView.swift
//  Clock
//
//  Created by richard Haynes on 6/25/23.
//
// https://www.youtube.com/watch?v=DdgBwjFIvx0
import SwiftUI


import SwiftUI
struct ContentView: View {
    @StateObject var clockViewModel = ClockViewModel()
    var body: some View {
        VStack {
          ClockView(model: clockViewModel)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
