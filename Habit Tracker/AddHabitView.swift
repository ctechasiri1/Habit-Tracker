//
//  AddHabitView.swift
//  Habit Tracker
//
//  Created by Chiraphat Techasiri on 12/4/24.
//

import SwiftData
import SwiftUI

struct AddHabitView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.modelContext) var modelContext
    @Query var habits: [Habit]
    
    @State private var habitName: String = ""
    @State private var habitDescription: String = ""
    @State private var charLimitName = 20
    @State private var charLimitDesc = 100
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Habit name") {
                    TextField("Add your details here", text: $habitName)
                        .onChange(of: habitName) {
                            if habitName.count > charLimitName {
                                habitName = String(habitName.prefix(charLimitName))
                            }
                        }
                }
                Section("Habit Description") {
                    TextField("Add your details here", text: $habitDescription, axis: .vertical)
                        .onChange(of: habitDescription) {
                            if habitDescription.count > charLimitDesc {
                                habitDescription = String(habitDescription.prefix(charLimitDesc))
                            }
                        }
                }
            }
            .navigationTitle("Add Habit")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let habit = Habit(habitName: habitName, habitDescription: habitDescription)
                        
                        modelContext.insert(habit)
                        
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddHabitView()
}
