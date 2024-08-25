//
//  SocketIOManager.swift
//  ChatWebSocket
//
//  Created by Vitor Mendes on 25/08/24.
//

import Foundation
import SocketIO

class SocketIOManager: NSObject {
    static let shared = SocketIOManager()
    
    private var manager: SocketManager!
    private var socket: SocketIOClient!

    override init() {
        super.init()
        let url = URL(string: "http://127.0.0.1:5000")!
        manager = SocketManager(socketURL: url, config: [.log(true), .compress])
        socket = manager.defaultSocket
    }

    func connect() {
        socket.on(clientEvent: .connect) {data, ack in
            print("Conectado ao servidor Socket.IO")
        }
        
        socket.on(clientEvent: .disconnect) {data, ack in
            print("Desconectado do servidor Socket.IO")
        }
        
        socket.on("customEvent") { data, ack in
            print("Evento personalizado recebido: \(data)")
        }

        socket.connect()
    }

    func sendMessage(event: String, message: String) {
        socket.emit(event, message)
    }

    func disconnect() {
        socket.disconnect()
    }
}
