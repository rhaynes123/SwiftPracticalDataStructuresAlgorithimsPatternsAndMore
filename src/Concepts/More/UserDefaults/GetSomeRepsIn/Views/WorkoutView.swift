//
//  ContentView.swift
//  GetSomeRepsIn
//
//  Created by richard Haynes on 5/6/23.
//

import SwiftUI

struct WorkoutView: View {
    @StateObject private var model = WorkoutViewModel()
    @State private var selectedExercise = Exercise(name: "Push-Ups", caloriesBurned: 0.36)
    @State private var repsDone = 0
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    private func saveReps(){
        model.saveWorkoutReps(numberOfReps: repsDone, exercise: self.selectedExercise)
    }
    var body: some View {
        Form {
            Picker("Exercises", selection: $selectedExercise) {
                ForEach(ExerciseList.exercises, id: \.self) { exercise in
                    Text(exercise.name)
                }
            }
            TextField("Reps Done", value: $repsDone, formatter: formatter)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Save", action: saveReps)
            
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            WorkoutView()
        }
    }
}
