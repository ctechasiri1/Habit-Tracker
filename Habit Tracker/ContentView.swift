//
//  ContentView.swift
//  Habit Tracker
//
//  Created by Chiraphat Techasiri on 12/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingAddHabit: Bool = false
    @ObservedObject var habitStore: HabitStore
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(habitStore.allHabits) { habit in
                    NavigationLink {
                        DisplayHabitView()
                    } label: {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(habit.name)
                                    .bold()
                                
                                Text(habit.counter.codingKey.stringValue)
                                
                                // I need to add the habit count
                            }
                            
                            Text(habit.description)
                                .font(.subheadline)
                                .padding()
                        }
                    }
                }
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button {
                    isShowingAddHabit.toggle()
                } label: {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add habit")
                    }
                }
            }
            .navigationDestination(isPresented: $isShowingAddHabit, destination: {
                AddHabitView(habitStore: habitStore)
            })
        }
    }
}

#Preview {
    let previewStore = HabitStore(userDefaultsKey: UUID().uuidString)

    return ContentView(habitStore: previewStore)
}
