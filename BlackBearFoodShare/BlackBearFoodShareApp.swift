//
//  BlackBearFoodShareApp.swift
//  BlackBearFoodShare
//
//  Created by Corey Kaulenas on 11/24/25.
//

import SwiftUI
import SwiftData

@main
struct BlackBearFoodShareApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
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
