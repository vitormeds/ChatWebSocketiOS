//
//  SocketIOManager.swift
//  ChatWebSocket
//
//  Created by Vitor Mendes on 25/08/24.
//

import Foundation
import SocketIO

protocol SocketIOManagerDelegate {
    func onMessage(message: Message)
}

class SocketIOManager: NSObject {
    static let shared = SocketIOManager()
    
    private var manager: SocketManager!
    private var socket: SocketIOClient!
    private var delegate: SocketIOManagerDelegate?

    override init() {
        super.init()
        let url = URL(string: "http://127.0.0.1:5000")!
        manager = SocketManager(socketURL: url, config: [.log(true), .compress])
        socket = manager.defaultSocket
    }

    func connect(delegate: SocketIOManagerDelegate) {
        self.delegate = delegate
        socket.on(clientEvent: .connect) {data, ack in
            print("Conectado ao servidor Socket.IO")
        }
        
        socket.on(clientEvent: .disconnect) {data, ack in
            print("Desconectado do servidor Socket.IO")
        }
        
        socket.on("message") { data, ack in
            guard let jsonData = data.first as? [String: Any] else {
                return
            }
            do {
                let data = try JSONSerialization.data(withJSONObject: jsonData, options: [])
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let message = try decoder.decode(Message.self, from: data)
                self.delegate?.onMessage(message: message)
            } catch {
                print("Erro ao decodificar mensagem: \(error)")
            }
        }

        socket.connect()
    }

    func sendMessage(message: Message) {
        do {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            let data = try encoder.encode(message)
            if let jsonString = String(data: data, encoding: .utf8) {
                socket.emit("message", jsonString)
            }
        } catch {
            print("Erro ao codificar mensagem: \(error)")
        }
    }

    func disconnect() {
        socket.disconnect()
    }
}
