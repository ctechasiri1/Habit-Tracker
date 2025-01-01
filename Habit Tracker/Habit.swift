//
//  Habit.swift
//  Habit Tracker
//
//  Created by Chiraphat Techasiri on 12/4/24.
//

import Foundation

/*
 -this code creates an identifiable habit which is defined by a id, name, and description.
 -being codable allows the habit to be encoded and then decoded into a JSON
 -the initializer generates an id for the habit if one isn't created
 */

struct Habit: Codable, Identifiable {
    var id = UUID()
    let name: String
    let description: String
    var counter: Int
    
    init(id: UUID = UUID(), name: String, description: String, counter: Int = 0) {
        self.id = id
        self.name = name
        self.description = description
        self.counter = counter
    }
}

// HabitStore stores all the habits in an array called allHabits and refreshes when the allHabits changes

class HabitStore: ObservableObject {
    private let userDefaultsKey: String
    
    @Published var allHabits = [Habit]() {
        // when change occurs (didSet) it encodes the habits in allHabits array useing a unique key called userDefaults
        didSet {
            if let encoded = try? JSONEncoder().encode(allHabits) {
                UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
            }
        }
    }
    
    // given the creation of a HabitStore, it will ask for a key and you can retrieve allHabits from that key
    init(userDefaultsKey: String) {
        self.userDefaultsKey = userDefaultsKey
        loadHabitsFromStorage()
    }
    
    // this function given that the key has data it will decode allHabits and display the habits
    private func loadHabitsFromStorage() {
        guard
            let savedData = UserDefaults.standard.data(forKey: userDefaultsKey),
            let decodedHabits = try? JSONDecoder().decode([Habit].self, from: savedData)
        else {
            return
        }
        allHabits = decodedHabits
    }
}
