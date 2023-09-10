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
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums, saveAction: saveData)
                .task { ///Recall that the task modifier allows asynchronous function calls.
                    do {
                        /// setting the scrums property in ScrumStore:
                        try await store.load()
                    } catch {
                        errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
                    }
                }
                /// when a error occurs:
                .sheet(item: $errorWrapper) {
                    // set the scrums to sample data on dismiss
                    store.scrums = DailyScrum.sampleData
                } content: { wrapper in
                    // show modal
                    ErrorView(errorWrapper: wrapper)
                }
        }
    }
    
    func saveData() {
        Task {
            do {
                try await store.save(scrums: store.scrums)
            } catch {
                errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger will load sample data and continue.")
            }
        }
    }
}
