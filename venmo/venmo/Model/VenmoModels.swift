//
//  VenmoModels.swift
//  venmo
//
//  Created by Ellie Kim on 11/24/23.
//

import Foundation

struct Payment: Identifiable, Hashable {
    
    var id = UUID()
    var sender: User
    var receiver: User
    var description: String
    var amount: Float
    var history: String
    var date: String
    var privacy: Bool
    var likeCount: Int
    let time: String
    
}

struct User: Identifiable, Hashable {
    var id = UUID()
    let name: String
    let image: String
    let username: String
}

// ViewModel -> test whether sender is yourself if so text should be YOU paid not name paid
// color negative or positive depending on amount
// to figure out time
// to figure out public or private

