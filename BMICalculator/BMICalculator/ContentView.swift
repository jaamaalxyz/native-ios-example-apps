//
//  ContentView.swift
//  BMICalculator
//
//  Created by Md. Jamal Uddin on 28/4/25.
//

import SwiftUI

struct ContentView: View {
    @State var height: String = ""
    @State var weight: String = ""
    @State var result: Double = 0.0
    @State var emoji: String = ""
    
    var body: some View {
        VStack {
            Text("BMI Calculator")
                .font(.largeTitle)
                .foregroundStyle(.tint)
            
            TextField("Height (cm)", text: $height)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
            
            TextField("Weight (kgs)", text: $weight)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
            
            if result > 0 {
                Text("\(emoji)")
                    .font(.headline)
                Text("Your BMI Score: \(result, specifier: "%.2f")")
                    .font(.title2)
            }
            
            Button {
                calculateBMI()
            } label: {
                Label("Calculate BMI", systemImage: "heart.fill")
            }
            .buttonStyle(.borderedProminent)
            .padding(.vertical, 20)
        }
        .padding(20)
    }
    
    func calculateBMI() {
        guard let heightValue = Double(height), let weightValue = Double(weight) else {
            self.result = 0.0
            return
        }
        let heightInMeters = heightValue / 100
        let bmi = weightValue / (heightInMeters * heightInMeters)
        self.result = bmi
        
        // Set emoji based on BMI category
        if bmi >= 18.5 && bmi <= 24.9 {
            emoji = "🎉"
        } else {
            emoji = "😢"
        }
    }
}

#Preview {
    ContentView()
}
