//
//  HistoryView.swift
//  GetSomeRepsIn
//
//  Created by richard Haynes on 5/7/23.
//

import SwiftUI
import CoreData
// https://www.youtube.com/watch?v=qlwQ_9aTeXA
// https://www.youtube.com/watch?v=nGmrtPNuE2Q
struct HistoryView: View {
    @AppStorage("showCalories") private var displayCalories :Bool = true
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Repetitions.id, ascending: true)],animation: .default
    )
    private var reps : FetchedResults<Repetitions>
    var body: some View {
        List {
            let showCals = displayCalories
            ForEach(reps) { rep in
                Text("\(rep.numberOf ) \(rep.exercise ?? "") Done On \(rep.dateTimeCompleted ?? Date())")
                if showCals {
                    Text("Calories burned: \(rep.caloriesBurned )")
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView().environment(\.managedObjectContext, PersistenceProvider.shared.container.viewContext)
    }
}
