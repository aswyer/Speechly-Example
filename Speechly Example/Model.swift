//
//  Model.swift
//  Speechly Example
//
//  Created by Andrew Sawyer on 6/17/22.
//

import Foundation
import Speechly

class Model: ObservableObject {
    @Published var subscribedTeams: Set<Team> = []
    
    @Published var speechRequest: SpeechRequest?
    @Published var isResponseSectionPresented = false
    
    @Published var transcriptText: String?
//    = "testing string remove when publishing. this is a very long request."
//    = "testing medium string"
//    = "test"
    
    @Published var isListening = false {
        didSet {
            if isListening {
                speechlyManager.client?.startContext()
            } else {
                speechlyManager.client?.stopContext()
            }
        }
    }
    
    private lazy var speechlyManager = SpeechlyManager(model: self)
    
    func updateTranscript(with transcriptText: String?) {
        self.transcriptText = transcriptText
    }
    
    func process(_ speechRequest: SpeechRequest) {
        guard speechRequest.intent != nil else {
            isResponseSectionPresented = false
            return
        }
        
        
        switch speechRequest.intent {
        case .followTeam:
            isResponseSectionPresented = false
            if speechRequest.isFinal {
                followTeam(speechRequest.team)
            }
            
        case .displayNews, .displayScores:
            self.speechRequest = speechRequest
            isResponseSectionPresented = true
            
        default:
            return
        }
    }
    
    private func followTeam(_ team: Team?) {
        guard let team = team else { return }
        subscribedTeams.insert(team)
    }
    
    
}

