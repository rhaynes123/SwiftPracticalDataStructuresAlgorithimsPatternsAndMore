//
//  WorkoutViewModel.swift
//  GetSomeRepsIn
//
//  Created by richard Haynes on 5/6/23.
//

import Foundation
final class WorkoutViewModel : ObservableObject {
    
    
    func saveWorkoutReps(numberOfReps : Int, exercise: Exercise){
        let totalCalories : Double = Double(numberOfReps) * exercise.caloriesBurned
        let reps = Repetitions(context: PersistenceProvider.shared.container.viewContext)
        
        reps.id = UUID()
        reps.dateTimeCompleted = Date()
        reps.numberOf = Int16(numberOfReps)
        reps.exercise = exercise.name
        reps.caloriesBurned = totalCalories
        
        PersistenceProvider.shared.saveContext()
        
    }
}
