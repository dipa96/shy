//
//  DailyScrum.swift
//  shy
//
//  Created by Donato Di Pasquale on 31/05/23.
//

import Foundation

struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [String]
    
    init(id: UUID = UUID(), title: String, attendees: [String]) {
        self.id = id
        self.title = title
        self.attendees = attendees
    }
}

extension DailyScrum {
    static var sampleData: [DailyScrum] {
        [
            DailyScrum(title: "Common Defense", attendees: ["Jailbreak", "Emulator", "Proxy", "Reversing", "Debug"]),
        ]
    }
}
