//
//  ContentView.swift
//  MightyReader
//
//  Created by Md. Jamal Uddin on 10/5/25.
//

import SwiftUI

struct ContentView: View {
    @State var posts: [Post] = []
    @State private var isLoading: Bool = true
    
    var body: some View {
        
        NavigationStack {
            Group {
                if isLoading {
                    VStack {
                        ProgressView("Loading posts...")
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if posts.isEmpty {
                    Text("No posts yet...")
                } else {
                    List(posts) { post in
                        NavigationLink(post.title) {
                            PostDetailsView(post: post)
                        }
                    }
                }
            }
            .navigationTitle("My Blog")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await posts = fetchPosts()
                isLoading = false
            }
        }
    }
    
    func fetchPosts() async -> [Post] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode([Post].self, from: data)
        } catch {
            print("Failed to fetch posts: \(error)")
            return []
        }
        
    }
}

#Preview {
    ContentView()
}
