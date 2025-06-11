//
//  ContentView.swift
//  Habit Tracker
//
//  Created by Chiraphat Techasiri on 12/4/24.
//

import SwiftData
import SwiftUI

//public extension Color {
//    static func randomColor(randomize: Bool = false) -> Color {
//        Color (
//            red: .random(in: 0...1),
//            green: .random(in: 0...1),
//            blue: .random(in: 0...1),
//            opacity: randomize ? .random(in: 0...1) : 1
//        )
//    }
//}

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var habits: [Habit]
    
    @State private var isShowingAddHabit: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(habits) { habit in
                    HStack {
                        Image(systemName: habit.habitIsCompleted ? "checkmark.circle.fill" : "circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(habit.habitIsCompleted ? Color.blue : Color.blue)
                        
                        Spacer()
                            .frame(width: 20.0)
                        
                        NavigationLink {
                            DisplayHabitView(modelContext: _modelContext, habit: habit)
                        } label: {
                            Text(habit.habitName)
                                .font(.system(size: 20))
                        }
                    }
                    .padding(.vertical, 10)
                    .listStyle(InsetGroupedListStyle())
                }
                .onDelete(perform: deleteHabit)
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Habit", systemImage: "plus") {
                        isShowingAddHabit.toggle()
                    }
                }
            }
            .sheet(isPresented: $isShowingAddHabit) {
                AddHabitView()
            }
        }
    }
    
    func deleteHabit(at offset: IndexSet) {
        for index in offset {
            modelContext.delete(habits[index])
        }
    }
}

#Preview {
    ContentView()
}
