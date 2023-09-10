//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Hamed Hashemi on 9/4/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    
    @StateObject private var store = ScrumStore()
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums, saveAction: saveData)
            .task { ///Recall that the task modifier allows asynchronous function calls.
                do {
                    /// setting the scrums property in ScrumStore:
                    try await store.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
    
    func saveData() {
        Task {
            do {
                try await store.save(scrums: store.scrums)
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
}
