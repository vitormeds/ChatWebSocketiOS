//
//  HomeView.swift
//  ChatWebSocket
//
//  Created by Vitor Mendes on 25/08/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        List(self.viewModel.messages) { message in
            ChatMessageView(message: message, isSentByCurrentUser: message.user == viewModel.user)
                .listRowSeparator(.hidden)
        }.onAppear(perform: {
            viewModel.conect()
        })
        .listStyle(.plain)
        .padding(.top, 8)
        Spacer()
        HStack {
            TextField("Digite uma mensagem...", text: $viewModel.newMessage)
                .onSubmit {
                sendMessage()
            }
            Button {
                sendMessage()
            } label: {
                Text("Enviar")
            }
        }
        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
    }
    
    func sendMessage() {
        viewModel.sendMessage()
        viewModel.newMessage = ""
    }
}

#Preview {
    HomeView()
}
