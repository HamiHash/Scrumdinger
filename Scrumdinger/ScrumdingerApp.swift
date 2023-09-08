//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Hamed Hashemi on 9/4/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
