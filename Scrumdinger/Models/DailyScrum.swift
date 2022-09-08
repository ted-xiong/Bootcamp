/*
See LICENSE folder for this sample’s licensing information.
*/

import Foundation

struct DailyScrum {
    // UUID stands for universally unique identifier
    let id: UUID
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
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
