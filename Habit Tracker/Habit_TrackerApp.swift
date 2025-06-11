//
//  Habit_TrackerApp.swift
//  Habit Tracker
//
//  Created by Chiraphat Techasiri on 12/4/24.
//

import SwiftData
import SwiftUI

@main
struct Habit_TrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Habit.self)
        }
    }
}
