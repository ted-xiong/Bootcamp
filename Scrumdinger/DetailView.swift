//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Ted Xiong on 9/8/22.
//

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    
    @State private var isPresentingEditView = false
    
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView()) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
            }
            Section (header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                    
                }
                
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            // when we click on this button, the isPresentingEditView is set to be true
            Button("Edit") {
                isPresentingEditView = true
            }
        }
        // When isPresentingView is true, a modal appears that partially covers the view with the DetailEditView on it
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView()
                    .navigationTitle(scrum.title)
                    .toolbar {
                        // We have two types of toolbar items that SwiftUI gives us: cancel and confirm.
                        // These basically confirm whether or not you're saving your changes to the @State variables in DetailEditView
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                            }
                        }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(scrum: DailyScrum.sampleData[0])
    }
}
