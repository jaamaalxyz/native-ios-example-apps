//
//  ContentView.swift
//  Counter
//
//  Created by Md. Jamal Uddin on 27/4/25.
//

import SwiftUI

struct ContentView: View {
    @State var counter: Int = 0
    
    var body: some View {
        Text("Counter: \(counter)")
            .font(.largeTitle)
        Button {
            counter += 1
        } label: {
            Label("Increment", systemImage: "plus")
        }
        .buttonStyle(.borderedProminent)
        Button {
            if counter > 0 {
                counter -= 1
            }
        } label: {
            Label("Decrement", systemImage: "minus")
        }
        .buttonStyle(.borderedProminent)
        Button {
            counter = 0
        } label: {
            Label("Reset", systemImage: "arrow.counterclockwise")
        }
        .buttonStyle(.borderedProminent)
        .tint(.red)
    }
}

#Preview {
    ContentView()
}
