//
//  SpeechInputView.swift
//  Speechly Example
//
//  Created by Andrew Sawyer on 6/22/22.
//

import Foundation
import SwiftUI

struct MicButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct SpeechInputView: View {
    
    @StateObject var model: Model
    
    private var longPressGesture: some Gesture {
        LongPressGesture(minimumDuration: 0)
            .onEnded { finished in
                withAnimation {
                    model.isListening = true
                }
            }
    }
    
    var body: some View {
        
        VStack(spacing: 20) {
            //Transcript
            if let transcriptText = model.transcriptText {
                Text(transcriptText)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .shadow(
                        color: Color.black.opacity(0.2),
                        radius: 40
                    )
            }
            
            //Mic Button
            Button {
                withAnimation {
                    model.isListening = false
                }
            } label: {
                Image(systemName: model.isListening ? "mic.fill" : "mic")
                    .font(.title)
                    .foregroundColor(.primary)
                    .padding()
                
                    .background(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 20))
            }
            .buttonStyle(MicButtonStyle())
            .zIndex(-1)
            .scaleEffect(model.isListening ? 1.1 : 1)
            
            .simultaneousGesture(longPressGesture)
            
            .shadow(
                color: model.isListening ? Color.blue : Color.black.opacity(0.3),
                radius: 40
            )
        }
    }
}
