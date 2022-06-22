//
//  Sport.swift
//  Speechly Example
//
//  Created by Andrew Sawyer on 6/21/22.
//

import Foundation

enum Sport: String, Identifiable {
    var id: Self {
        return self
    }
    
    case football
    case soccer
    case tennis
    case baseball
    case basketball
    case swimming
    case golf
    case hockey
    case lacrosse
    case running
}

