//
//  ContentView.swift
//  QouteVault
//
//  Created by Md. Jamal Uddin on 10/5/25.
//

import SwiftUI

struct Quote: Codable, Identifiable {
    let id: Int
    let text: String
    let author: String
}

struct ContentView: View {
    private var quotes: [Quote] {
        guard let url = Bundle.main.url(forResource: "quotes", withExtension: "json") else {
            return []
        }
        do {
            let data = try Data(contentsOf: url)
            return try
                JSONDecoder().decode([Quote].self, from: data)
        } catch {
            print("Failed to load quotes: \(error)")
            return []
        }
    }
    
    var body: some View {
        List(quotes) { quote in
            QuoteCardView(quote: quote)
                .listRowInsets(EdgeInsets())
                .padding(.vertical, 8)
                .padding(.horizontal, 4)
                .background(Color.gray.opacity(0.1))
                .listRowSeparator(.hidden)
        }
        
        
    }
}

#Preview {
    ContentView()
}
