//
//  DisplayHabitView.swift
//  Habit Tracker
//
//  Created by Chiraphat Techasiri on 12/31/24.
//

import SwiftData
import SwiftUI

struct DisplayHabitView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    // Bindable lets you edit the habit directly otherwise it only observable
    @Bindable var habit: Habit
    
    var body: some View {
        NavigationStack {
            VStack() {
                Text(habit.habitDescription)
                    .frame(width: 350, height: 100, alignment: .leading)
                    .font(.title2)
                
                Text("COMPLETED")
                    .frame(width: 350, alignment: .leading)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.gray)
                
                HStack {
                    Text("\(habit.habitCounter)")
                        .font(.system(size: 75.0))
                        .fontWeight(.bold)
                    
                    Text("times")
                        .font(.system(size: 25.0))
                }
                .frame(width: 350, alignment: .leading)
            }
            
            Spacer()
                .frame(height: 300)
            
            Button {
                habit.habitCounter += 1
                habit.habitIsCompleted = true
                try? modelContext.save()
            } label: {
                Text("Mark Completed")
                    .font(Font.title)
                    .foregroundStyle(Color.white)
                    .frame(width: 300, height: 75)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            Spacer()
        }
        .navigationTitle(habit.habitName)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.backward")
                    .foregroundStyle(Color.blue)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

#Preview {
    DisplayHabitView(habit: Habit(habitName: "Smoke Cigs", habitDescription: "I want to smoke cigs every single day"))
}
