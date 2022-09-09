/*
See LICENSE folder for this sample’s licensing information.
*/

import Foundation

struct DailyScrum: Identifiable {
    // UUID stands for universally unique identifier
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map{Attendee(name: $0)}
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    // This struct contains the editable properties of DailyScrum
    struct Data {
        var title: String = ""
        var attendees: [Attendee] = []
        var lengthInMinutes: Double = 5
        var theme: Theme = .seafoam
    }
    
    // We add a computed data property that returns Data with the DailyScrum property values
    var data: Data {
        Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), theme: theme)
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design", attendees: ["Tina", "Karan", "Makya", "Nima"], lengthInMinutes: 10, theme: .yellow),
        DailyScrum(title: "App Dev", attendees: ["Fazil", "Willie", "Ted", "Tina", "Karan"], lengthInMinutes: 5, theme: .orange),
        DailyScrum(title: "Web Dev", attendees: ["Makya", "Nima", "Fazil", "Willie", "Ted", "Tina", "Karan", "Makya", "Nima", "Fazil"], lengthInMinutes: 5, theme: .poppy)
    ]
}
