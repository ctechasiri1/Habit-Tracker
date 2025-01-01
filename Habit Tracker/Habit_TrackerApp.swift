//
//  Habit_TrackerApp.swift
//  Habit Tracker
//
//  Created by Chiraphat Techasiri on 12/4/24.
//

import SwiftUI

@main
struct Habit_TrackerApp: App {
    let habitStore = HabitStore(userDefaultsKey: "MainHabitStorageKey")
    
    var body: some Scene {
        WindowGroup {
            ContentView(habitStore: habitStore)
        }
    }
}
