//
//  QuoteCardView.swift
//  QouteVault
//
//  Created by Md. Jamal Uddin on 10/5/25.
//

import SwiftUI

struct QuoteCardView: View {
    let quote: Quote

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("“\(quote.text)”")
                .font(.body)
                .italic()
                .fixedSize(horizontal: false, vertical: true)

            Text("- \(quote.author)")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}
