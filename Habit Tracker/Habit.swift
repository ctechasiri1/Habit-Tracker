//
//  Habit.swift
//  Habit Tracker
//
//  Created by Chiraphat Techasiri on 12/4/24.
//

import SwiftData
import Foundation

/*
 -this code creates an identifiable habit which is defined by a id, name, and description.
 -being codable allows the habit to be encoded and then decoded into a JSON
 -the initializer generates an id for the habit if one isn't created
 */

@Model
class Habit {
    var habitName: String
    var habitDescription: String
    var habitCounter: Int
    var habitIsCompleted: Bool
    
    init(habitName: String, habitDescription: String, habitCounter: Int = 0, habitIsCompleted: Bool = false) {
        self.habitName = habitName
        self.habitDescription = habitDescription
        self.habitCounter = habitCounter
        self.habitIsCompleted = habitIsCompleted
    }
}
