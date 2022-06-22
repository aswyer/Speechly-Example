//
//  ResponseSections.swift
//  Speechly Example
//
//  Created by Andrew Sawyer on 6/22/22.
//

import Foundation
import SwiftUI


struct ResponseSection: View {
    var request: SpeechRequest
    
    var body: some View {
        switch request.intent {
        case .displayNews:
            NewsSection(request: request)
            
        case .displayScores:
            ScoresSection(request: request)
            
        default:
            Text("error")
        }
    }
}

//MARK: Following Teams Section
struct FollowingTeamsSection: View {
    
    var teams: Set<Team>
    
    var body: some View {
        if !teams.isEmpty {
            Section("Teams Following") {
                ForEach( Array(teams) ) { team in
                    Text(team.rawValue.capitalized)
                }
            }
        }
    }
}

//MARK: News Section
struct NewsSection: View {
    
    var request: SpeechRequest
    
    
    var body: some View {
        Section(request.newsTitle) {
            VStack(alignment: .leading) {
                Text("Go \(request.teamSportCombo() ?? "Sports")!")
                    .font(.headline)
                Spacer()
                Text("After a 25-6 start, the \(request.team?.rawValue ?? "team") suffered their first lull, but they had rebounded by now. After winning, again, exactly six years ago Sunday, they were 47-20.")
            }
            .padding()
        }
    }
}

//MARK: Scores Section
struct ScoresSection: View {
    var request: SpeechRequest
    
    var body: some View {
        Section(request.scoresTitle) {
            HStack {
                Text("47 - 35")
                    .frame(maxWidth: .infinity)
                    .font(.title)
                
                Divider()
                
                Text("Go \(request.teamSportCombo() ?? "Sports")!")
                    .frame(maxWidth: .infinity)
                    .font(.headline)
                
            }
            .padding()
        }
        
    }
}
