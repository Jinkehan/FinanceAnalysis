//
//  FinanceAnalysisApp.swift
//  FinanceAnalysis
//
//  Created by Kehan Jin on 2/27/25.
//

import SwiftUI
import SwiftData

@main
struct FinanceAnalysisApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
            SingleSpending.self,
            AccountBook.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
