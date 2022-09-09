//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Ted Xiong on 9/8/22.
//

import SwiftUI

struct DetailEditView: View {
    // Here we add an @State property for data
    @State private var data = DailyScrum.Data()
    // This will hold the attendee name that the user enters
    @State private var newAttendeeName = ""

    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                // TextField takes a binding to a String. We use the $ syntax to create a binding to data.title
                TextField("Title", text: $data.title)
                HStack {
                    // This slider stores a double from a continuous range that you specify. Passing a stap value of 1 means that the user can only choose whole numbers
                    Slider(value: $data.lengthInMinutes, in: 5...30, step: 1)
                    Spacer()
                    Text("\(Int(data.lengthInMinutes))")
                }
            }
            // Here is another section of the edit view for attendees
            Section(header: Text("Attendees")) {
                // Again, we don't include the "id:" parameter for the ForEach function since we already have attendees identifiable by their UUID
                ForEach(data.attendees) { attendee in
                    Text(attendee.name)
                }
                // onDelete allows you to remove attendees from the scrum data
                .onDelete { indices in
                    // When you swipe left to delete a row, the stuff here will execute:
                    data.attendees.remove(atOffsets: indices)
                    // What is deleted is dependent on the index ^
                }
                HStack {
                    // Anything you type in this field will be stored into newAttendeeName
                    TextField("New Attendee", text: $newAttendeeName)
                    // If we click the button, the string inside newAttendeeName will become the DailyScrum's Attendee's name property
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            // We also went ahead and added name to the list of attendees in data
                            data.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    // This makes it so that we can only click the button if we put something in the "New Attendee" field
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView()
    }
}
