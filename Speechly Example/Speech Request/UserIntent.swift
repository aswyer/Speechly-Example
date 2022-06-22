//
//  UserIntent.swift
//  Speechly Example
//
//  Created by Andrew Sawyer on 6/17/22.
//

import Foundation

enum UserIntent: String, Identifiable {
    var id: Self {
        return self
    }
    
    case displayNews
    case followTeam
    case displayScores
}
