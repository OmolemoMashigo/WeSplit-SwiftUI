//
//  ContentView.swift
//  WeSplit
//
//  Created by Omolemo Mashigo on 2024/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
   
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [0, 10, 15, 20]
    
    var totalPerPerson: Double{
        let tipSelection = Double(tipPercentage)
        let tipValue = (checkAmount / 100) * tipSelection
        let grandTotal = checkAmount + tipValue
        //totalAmount = Int(grandTotal)
        let amountPerPerson = grandTotal / Double(numberOfPeople + 2)
        
        return amountPerPerson
    }
    
    var totalAmount: Double {
        return totalPerPerson * Double(numberOfPeople)
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused) //amountIsFocused is set to true when the TextField is active
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }.pickerStyle(.navigationLink)
                }
                
                Section("how much do you want to tip?"){
                    Picker("tip percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.segmented)
                }
                
                Section("total amount"){
                    //TODO: fix totalAmount bug
                    //the totalPerPerson is multiplied with the initial numberOfPeople
                    // which is 0 and the amountPerPerson is always multiplied by 2 instead of the modified numberOfPeople
                    Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundColor(tipPercentage == 0  ? .red : .black)
                        
                }
                
                Section("Amount per person"){
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                
            }
            .navigationTitle("WeSplit")
            .toolbar{
                if amountIsFocused{
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
