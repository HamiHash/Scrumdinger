//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Hamed Hashemi on 9/9/23.
//

import SwiftUI

struct NewScrumSheet: View {
    
    @Binding var scrums: [DailyScrum]
    @Binding var isPresentingNewScrumView: Bool
    @State private var newScrum = DailyScrum.emptyScrum
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingNewScrumView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            isPresentingNewScrumView = false
                            scrums.append(newScrum)
                        }
                    }
                }
        }
    }
}

struct NewScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewScrumSheet(scrums: .constant(DailyScrum.sampleData), isPresentingNewScrumView: .constant(true))
    }
}
