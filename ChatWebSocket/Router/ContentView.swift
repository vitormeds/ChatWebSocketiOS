//
//  ContentView.swift
//  ChatWebSocket
//
//  Created by Vitor Mendes on 25/08/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject private var router = Router()
    
    var body: some View {
        NavigationStack(path: $router.navPath) {
            MainView()
                .navigationDestination(for: Router.Destination.self) { destination in
                    switch destination {
                    case .home:
                        HomeView()
                            .navigationBarBackButtonHidden()
                    }
                }
        }
        .environmentObject(router)
    }
}
