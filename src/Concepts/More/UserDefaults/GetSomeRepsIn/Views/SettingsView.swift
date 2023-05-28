//
//  SettingsView.swift
//  GetSomeRepsIn
//
//  Created by richard Haynes on 5/7/23.
//

import SwiftUI
// https://www.youtube.com/watch?v=qlwQ_9aTeXA
// https://www.youtube.com/watch?v=nGmrtPNuE2Q
struct SettingsView: View {
    @AppStorage("showCalories") private var showCalories = true
    
    private func SetCaloriesDefault(displayCalories: Bool){
        UserDefaults.standard.set(displayCalories, forKey: "showCalories")
    }
    var body: some View {
        Form{
            Toggle("Show Calories",isOn: $showCalories)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
