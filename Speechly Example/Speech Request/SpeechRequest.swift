//
//  SpeechRequest.swift
//  Speechly Example
//
//  Created by Andrew Sawyer on 6/21/22.
//

import Foundation

struct SpeechRequest {
    
    var isFinal = false
    
    var intent: UserIntent?
    var team: Team?
    var sport: Sport?
    
    var newsTitle: String {
        if let teamSportCombo = teamSportCombo() {
            return "News for \(teamSportCombo)"
        }

        return "News"
    }
    
    var scoresTitle: String {
        if let teamSportCombo = teamSportCombo() {
            return "Scores for \(teamSportCombo)"
        }

        return "Scores"
    }
    
    func teamSportCombo() -> String? {
        if team == nil, sport == nil { return nil }
        
        var title = ""
        
        if let team = team {
            title.append(team.rawValue)
        }
        
        if team != nil, sport != nil {
            title.append(" ")
        }
        
        if let sport = sport {
            title.append(sport.rawValue)
        }
        
        return title.capitalized
    }
}
