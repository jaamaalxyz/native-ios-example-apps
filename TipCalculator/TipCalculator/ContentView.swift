//
//  ContentView.swift
//  TipCalculator
//
//  Created by Md. Jamal Uddin on 27/4/25.
//

import SwiftUI

struct ContentView: View {
    @State var billedAmount: String = ""
    @State var tipPercentage: Double = 15
    
    var tip: Double {
        let amount = Double(billedAmount) ?? 0
        let tip = amount * tipPercentage / 100
        
        return tip
    }
    
    var total: Double {
        let amount = Double(billedAmount) ?? 0
        let tip = self.tip
        
        return amount + tip
    }
    
    var body: some View {
        VStack {
            Text("Tip Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.blue)
            TextField("Enter bill amount", text: $billedAmount)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
            Text("Tip percentage (%) \(Int(tipPercentage))")
            Slider(value: $tipPercentage, in: 0...30, step:1)
            Text("Tip amount \(tip, specifier: "%.2f")")
                .font(.footnote)
            Text("Total bill \(total, specifier: "%.2f")")
                .font(.headline)
        }
        .padding(20)
    }
}

#Preview {
    ContentView()
}
