//
//  HomeViewModel.swift
//  ChatWebSocket
//
//  Created by Vitor Mendes on 25/08/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var messages: [Message] = []
    @Published var isLoading = false
    @Published var error: Error? = nil
    @Published var newMessage: String = ""
    var user = ""
    
    let webSocket = SocketIOManager()
    
    func conect() {
        webSocket.connect(delegate: self)
        user = UUID().uuidString
    }
    
    func sendMessage() {
        let newMessage = Message(id: UUID().uuidString, message: newMessage, user: user)
        webSocket.sendMessage(message: newMessage)
        self.messages.append(newMessage)
    }
    
}

extension HomeViewModel: SocketIOManagerDelegate {
    
    func onMessage(message: Message) {
        if message.user != user {
            self.messages.append(message)
        }
    }
}

extension Encodable {
  func asDictionary() throws -> [String: Any] {
    let data = try JSONEncoder().encode(self)
    guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
      throw NSError()
    }
    return dictionary
  }
}
