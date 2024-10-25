//
//  ContentView.swift
//  WeSplit
//
//  Created by Omolemo Mashigo on 2024/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            Form{
                Text("HELLO WORLD")
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    ContentView()
}
