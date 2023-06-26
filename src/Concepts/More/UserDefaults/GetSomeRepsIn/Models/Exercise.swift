//
//  Exercise.swift
//  GetSomeRepsIn
//
//  Created by richard Haynes on 5/6/23.
//

import Foundation
struct Exercise : Hashable {
    var id : UUID
    var name : String
    var caloriesBurned : Double
    
    init(name: String, caloriesBurned: Double) {
        self.id = UUID()
        self.name = name
        self.caloriesBurned = caloriesBurned
    }
}

struct ExerciseList{
    static var exercises : [Exercise] = [
        Exercise(name: "Wall Push-Up", caloriesBurned: 0.36),
        Exercise(name: "Push-Up", caloriesBurned: 0.36),
        Exercise(name: "Squat", caloriesBurned: 0.32),
        Exercise(name: "Crunch", caloriesBurned: 0.25),
        Exercise(name: "Sit Up", caloriesBurned: 0.25),
        Exercise(name: "Chin Up", caloriesBurned: 1.00),
        Exercise(name: "Pull Up", caloriesBurned: 1.00),
        Exercise(name: "Knee Tuck", caloriesBurned: 0.25),
        Exercise(name: "Flat Knee Raise", caloriesBurned: 0.25),
        Exercise(name: "Leg Raise", caloriesBurned: 0.25),
        Exercise(name: "Bridge", caloriesBurned: 0.71),
        Exercise(name: "Handstand", caloriesBurned: 0.25),
    ]
}
