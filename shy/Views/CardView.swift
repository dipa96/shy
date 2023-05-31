//
//  CardView.swift
//  shy
//
//  Created by Donato Di Pasquale on 31/05/23.
//

import SwiftUI

struct CardView: View {
    // Declare DailyScrum obj
    let scrum: DailyScrum
    var body: some View {
        // Show title of DailyScrum in Text
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
            Spacer()
            HStack {
                Spacer()
                //Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                Text("Total: ").font(.caption)
                Label("\(scrum.attendees.count)", systemImage: "lock.shield")
                    .padding(.trailing, 10)
            }
            .font(.caption)
        }
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    // Setup DailyScrum in Preview
    static var scrum = DailyScrum.sampleData[0]
    static var previews: some View {
        CardView(scrum: scrum)
            // Creating view of card/toast
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
