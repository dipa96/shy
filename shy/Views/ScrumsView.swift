//
//  ScrumsView.swift
//  shy
//
//  Created by Donato Di Pasquale on 31/05/23.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
  
    var body: some View {
        NavigationStack {
            List(scrums) { scrum in
                //NavigationLink(destination: DetailView(scrum: scrum, DefenseCheck: DefenseCheckHandler())) {
                // NavigationLink(destination: DetailView(scrum: scrum, defenseCheck: Steroids())) {
                NavigationLink(destination: DetailCheck(scrum: scrum)) {
                    CardView(scrum: scrum)
                }
            }
            .navigationTitle("Insecure Daily Scrums")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.sampleData)
    }
}
