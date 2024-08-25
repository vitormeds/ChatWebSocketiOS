//
//  Messages.swift
//  ChatWebSocket
//
//  Created by Vitor Mendes on 25/08/24.
//

import Foundation

struct Messages {
    let messages: [Message]?
}

struct Message: Codable, Identifiable {
    let id = UUID()
    let message: String
}


