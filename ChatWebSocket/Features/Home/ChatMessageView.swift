//
//  ChatMessageView.swift
//  ChatWebSocket
//
//  Created by Vitor Mendes on 27/08/24.
//

import SwiftUI

struct ChatMessageView: View {
    let message: Message
    let isSentByCurrentUser: Bool
    
    var body: some View {
        HStack {
            if isSentByCurrentUser {
                Spacer()
                Text(message.message)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .frame(maxWidth: 250, alignment: .trailing)
            } else {
                Text(message.message)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .frame(maxWidth: 250, alignment: .leading)
                Spacer()
            }
        }
        .padding(isSentByCurrentUser ? .leading : .trailing, 50)
        .padding(.horizontal)
    }
}

#Preview {
    ChatMessageView(message: Message(id: "1", message: "Ola tudo bem ?", user: "Joao"), isSentByCurrentUser: true)
}
