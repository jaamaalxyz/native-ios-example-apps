//
//  Post.swift
//  MightyReader
//
//  Created by Md. Jamal Uddin on 10/5/25.
//

import Foundation

struct Post: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String
}
