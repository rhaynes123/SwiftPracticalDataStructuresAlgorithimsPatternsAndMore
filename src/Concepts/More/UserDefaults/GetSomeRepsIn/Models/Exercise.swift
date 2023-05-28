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
        Exercise(name: "Push-Ups", caloriesBurned: 0.36),
        Exercise(name: "Squat", caloriesBurned: 0.32),
        Exercise(name: "Crunch", caloriesBurned: 0.25),
        Exercise(name: "Pullups", caloriesBurned: 0.25),
    ]
}
