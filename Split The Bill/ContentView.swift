//
//  ContentView.swift
//  Split The Bill
//
//  Created by Jaydeepsinh Parmar on 7/31/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var totalCost = ""
    @State private var people = 2
    @State private var tipIndex = 2
    let tipPercentages = [0, 5, 10, 15]
    
    func calculateFinalCost() -> Double {
        let tip = Double(tipPercentages[tipIndex])
        let orderTotal = Double(totalCost) ?? 0
        let finalAmt = ((orderTotal / 100) * tip + orderTotal)
        return finalAmt / Double(people)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(
                    header: Text("Enter an Amount 💸").bold()
                ) {
                    TextField("Amount", text: $totalCost)
                        .keyboardType(.decimalPad)
                }
                
                Section(
                    header: Text("Select A Tip Amount (％) ").bold()
                ) {
                    Picker(
                        "Tip Percentage",
                        selection: $tipIndex) {
                            ForEach(0 ..< tipPercentages.count) {
                                Text("\(tipPercentages[$0]) %")
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(
                    header: Text(
                        "How Select Number of People 💁🏻‍♂️"
                    ).bold()
                ) {
                    Picker(
                        "Tip Percentage",
                        selection: $people) {
                            ForEach(0 ..< 51) {
                                Text("\($0) People")
                            }
                        }
                }
                
                Section(
                    header: Text(
                        "Total Per Person "
                    ).bold()
                ) {
                    Text("₹ \(calculateFinalCost(), specifier: "%.2f")")
                }
                
            }.navigationTitle("Split The Bill 💵")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
