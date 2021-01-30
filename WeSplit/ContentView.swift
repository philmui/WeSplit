//
//  CheckView.swift
//  WeSplit
//
//  Created by Phil Mui on 1/29/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeopleIndex = 2
    @State private var tipPercentageIndex = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeopleIndex + 2)
        let tipSelection = Double(tipPercentages[tipPercentageIndex])
        let totalAmount = Double(checkAmount.trimmingCharacters(in: .whitespacesAndNewlines)) ?? 0.0
        return totalAmount * (1 + tipSelection/100) / peopleCount
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of People", selection: $numberOfPeopleIndex) {
                        ForEach(2 ..< 50) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much tip to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentageIndex) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
