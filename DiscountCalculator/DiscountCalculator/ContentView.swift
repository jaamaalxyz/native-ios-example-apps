//
//  ContentView.swift
//  DiscountCalculator
//
//  Created by Md. Jamal Uddin on 27/4/25.
//

import SwiftUI

struct ContentView: View {
    @State var price: String = ""
    @State var discount: String = ""
    @State var result: Double = 0.0
    
    var body: some View {
        VStack {
            TextField("Enter original price", text: $price)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
            TextField("Enter discount (%)", text: $discount)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
            Button("Calculate") {
                let price = Double(self.price) ?? 0
                let discount = Double(self.discount) ?? 0
                result = price * (1 - (discount / 100))
            }
            .buttonStyle(.borderedProminent)
            if result > 0 {
                Text("Discounted price: $\(result, specifier: "%.2f")")
                    .font(.title2)
            }
        }
        .padding(20)
    }
}

#Preview {
    ContentView()
}
