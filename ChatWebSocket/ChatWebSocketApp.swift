//
//  ChatWebSocketApp.swift
//  ChatWebSocket
//
//  Created by Vitor Mendes on 25/08/24.
//

import SwiftUI

@main
struct ChatWebSocketApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
