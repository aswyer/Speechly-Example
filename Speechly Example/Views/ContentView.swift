//
//  ContentView.swift
//  Speechly Example
//
//  Created by Andrew Sawyer on 6/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var model = Model()
    
    var body: some View {
        
        List {
            NavigationLink("Guide") {
                GuideSection()
            }
            
            FollowingTeamsSection(teams: model.subscribedTeams)
            
            if
                model.isResponseSectionPresented,
                let request = model.speechRequest
            {
                ResponseSection(request: request)
            }
            
            
        }
        .listStyle(.insetGrouped)
        
        .safeAreaInset(edge: .bottom) {
            SpeechInputView(model: model)
                .padding(.horizontal)
        }
        
        .animation(.default, value: model.isResponseSectionPresented)
        .animation(.default, value: model.subscribedTeams)
        
        .navigationTitle("Sports!")
    }
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
