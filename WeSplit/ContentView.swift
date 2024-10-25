//
//  ContentView.swift
//  WeSplit
//
//  Created by Omolemo Mashigo on 2024/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    var body: some View {
        Form{
            TextField("Enter your name", text: $name) //two-way binding: the value is read, but also written back
            Text("your name is: \(name)")
        }
        
    }
}

#Preview {
    ContentView()
}
