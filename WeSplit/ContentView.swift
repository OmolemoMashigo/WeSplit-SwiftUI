//
//  ContentView.swift
//  WeSplit
//
//  Created by Omolemo Mashigo on 2024/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    var body: some View {
        NavigationStack{
            Form{
                Text("HELLO WORLD")
                Button("tap count: \(tapCount)"){
                    tapCount += 1
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    ContentView()
}
