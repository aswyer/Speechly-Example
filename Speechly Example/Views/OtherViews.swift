//
//  OtherViews.swift
//  Speechly Example
//
//  Created by Andrew Sawyer on 6/22/22.
//

import Foundation
import SwiftUI

struct GuideSection: View {
    var body: some View {
        
        List {
            Section {
                Text("Say something with the intent of the examples below. In this project teams are US states. Sports include football, soccer, swimming, etc.")
                    .padding([.vertical])
            }
            Section {
                VStack(alignment: .leading) {
                    Text("Follow a Team")
                        .font(.headline)
                    //                        Text("I want to see news about [US state]")
                    Text("ex: \"follow georgia sports\"")
                        .foregroundColor(.secondary)
                }
                
                VStack(alignment: .leading) {
                    Text("See the News")
                        .font(.headline)
                    //                        Text("[sport] news for [US state]")
                    Text("ex: \"football news for georgia\"")
                        .foregroundColor(.secondary)
                }
                
                VStack(alignment: .leading) {
                    Text("Check the Score")
                        .font(.headline)
                    //                        Text("what is the score for [US state] [sport]")
                    Text("ex: \"what is the score for georgia football\"")
                        .foregroundColor(.secondary)
                }
            }
            
        }
        .navigationTitle("Guide")
        .navigationBarTitleDisplayMode(.inline)
    }
}
