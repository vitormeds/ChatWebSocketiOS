//
//  HomeViewModel.swift
//  ChatWebSocket
//
//  Created by Vitor Mendes on 25/08/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var messages: [String]?
    @Published var isLoading = false
    @Published var error: Error? = nil
    let webSocket = SocketIOManager()
    
    func conect() {
        webSocket.connect()
    }
    
}
