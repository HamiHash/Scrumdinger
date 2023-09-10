//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Hamed Hashemi on 9/6/23.
//

import SwiftUI

struct ScrumsView: View {
    
    @Environment(\.scenePhase) private var scenePhase
    @Binding var scrums: [DailyScrum]
    @State var isPresentingNewScrumView = false
    let saveAction: ()->Void
    
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {
                    isPresentingNewScrumView = true
                }) {
                    Image(systemName: "plus.circle")
                }
                .sheet(isPresented: $isPresentingNewScrumView) {
                    NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
                }
                .accessibilityLabel("New scrum")
            }
        }
        /// when the 'scenePhase' changes:
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
    }
}
