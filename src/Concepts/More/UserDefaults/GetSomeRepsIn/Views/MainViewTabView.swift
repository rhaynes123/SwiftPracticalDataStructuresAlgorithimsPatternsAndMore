//
//  MainViewTabView.swift
//  GetSomeRepsIn
//
//  Created by richard Haynes on 5/7/23.
//

import SwiftUI

struct MainViewTabView: View {
    var body: some View {
        TabView {
            WorkoutView()
                .tabItem {
                    Image(systemName: "figure.run.circle.fill")
                    Text("Workout")
                    
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Settings")
                }
            HistoryView()
                .tabItem {
                    Image(systemName: "clock.arrow.circlepath")
                    Text("History")
                }
        }.padding()
            .font(.headline)
    }
}

struct MainViewTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainViewTabView()
    }
}
