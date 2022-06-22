//
//  SpeechlyManager.swift
//  Speechly Example
//
//  Created by Andrew Sawyer on 6/21/22.
//

import Foundation
import Speechly

class SpeechlyManager {
    
    weak var model: Model?
    var client: Speechly.Client?

    init(model: Model) {
        self.model = model
        
        guard let id = UUID(uuidString: "8e21cd22-ca4b-4eb0-b2d3-1674007990b0") else { return }
        do {
            client = try Speechly.Client(
                appId: id
            )
            client?.delegate = self
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    private func processSegment(_ segment: Segment) {
        //transcript
        let transcriptText = segment.transcripts.compactMap { transcript in
            return transcript.value
        }.joined(separator: " ")
        model?.updateTranscript(with: transcriptText.lowercased())
        
        //create & process request
        let speechRequest = createRequest(for: segment)
        model?.process(speechRequest)
    }
    
    
    private func createRequest(for segment: Segment) -> SpeechRequest {
        
        var speechRequest = SpeechRequest(isFinal: segment.isFinal)
        
        speechRequest.intent = UserIntent(rawValue: segment.intent.value)
        
        segment.entities.forEach { entity in
            switch entity.type {
            case "teamName":
                speechRequest.team = Team(rawValue: entity.value.lowercased())
            case "sport":
                speechRequest.sport = Sport(rawValue: entity.value.lowercased())
            default:
                debugPrint("unknown entity type: \(entity.type) \(entity.value)")
            }
        }
        
        return speechRequest
    }
    
    
}


extension SpeechlyManager: SpeechlyDelegate {
    
    func speechlyClientDidUpdateSegment(_ speechlyClient: SpeechlyProtocol, segment: Segment) {
        DispatchQueue.main.async {
            self.processSegment(segment)
        }
    }
}
