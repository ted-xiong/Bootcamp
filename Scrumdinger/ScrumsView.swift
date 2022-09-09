//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Ted Xiong on 9/8/22.
//

import SwiftUI

struct ScrumsView: View {
    // scrums contains an array of our custom DailyScrum data type
    let scrums: [DailyScrum]
    
    var body: some View {
        // we're putting everything in a special kind of view called a list
        // this basically puts everything under it in a view
        List {
            // this is how we populate it. This is saying "for each DailyScrum data type in the scrums variable we have on top,
            // we're going to stick it in a card view, make the background of the card the main theme color of the scrum"
            ForEach(scrums) { scrum in
                NavigationLink (destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)

                }
                .listRowBackground(scrum.theme.mainColor)

            }
        }
        .navigationTitle("Daily Scrums")
        .toolbar {
            Button(action: {}) {
                Image(systemName: "plus")
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: DailyScrum.sampleData)

        }
    }
}
