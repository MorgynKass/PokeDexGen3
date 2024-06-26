//
//  PokeDexGen3App.swift
//  PokeDexGen3
//
//  Created by Morgyn Peay on 6/26/24.
//

import SwiftUI

@main
struct PokeDexGen3App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
