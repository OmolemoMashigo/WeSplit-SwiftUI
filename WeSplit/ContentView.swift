//
//  ContentView.swift
//  WeSplit
//
//  Created by Omolemo Mashigo on 2024/10/24.
//

import SwiftUI

struct ContentView: View {
    let students = ["Joe", "Jonn", "Jeff"]
    @State private var selectedStudent = "Joe"
    var body: some View {
        NavigationStack{
            Form{
                Picker("select your student",selection: $selectedStudent){
                    ForEach(students, id: \.self){
                        // the id: \.self means the strings in the array are each unique and thus assigns a unique identifier to each student
                        Text($0)
                    }
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
