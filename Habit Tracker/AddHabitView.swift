//
//  AddHabitView.swift
//  Habit Tracker
//
//  Created by Chiraphat Techasiri on 12/4/24.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var habitName: String = ""
    @State private var habitDescription: String = ""
    @State private var habitCounter: Int = 0
    
    @ObservedObject var habitStore: HabitStore
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Habit Name") {
                    TextField("Add a habit", text: $habitName)
                }
                Section("Habit Description") {
                    TextField("Add your details here", text: $habitDescription, axis: .vertical)
                }
            }
            .navigationTitle("Add a Habit")
            .toolbar {
                Button {
                    // I need to know how to save data properly this isn't how you encode and decode data in a json file
                    let newHabit = Habit(
                        name: habitName,
                        description: habitDescription, 
                        counter: habitCounter
                    )
                    
                    habitStore.allHabits.append(newHabit)
                    
                    habitName = ""
                    habitDescription = ""
                    
                    self.presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    Text("Save")
                        .padding()
                }
            }
        }
    }
}

#Preview {
    let previewStore = HabitStore(userDefaultsKey: UUID().uuidString)

    return AddHabitView(habitStore: previewStore)
}
