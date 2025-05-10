//
//  PostDetailsView.swift
//  MightyReader
//
//  Created by Md. Jamal Uddin on 10/5/25.
//

import SwiftUI

struct PostDetailsView: View {
    let post: Post
    var body: some View {
        VStack {
            Text(post.title)
                .font(.headline)
            Text(post.body)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .navigationTitle(post.title)
    }
}
