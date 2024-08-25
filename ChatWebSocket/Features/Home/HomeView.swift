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
            Text(message.message)
                .frame(maxWidth: .infinity, alignment: message.user != viewModel.user ? .leading:.trailing)
                .foregroundStyle(message.user != viewModel.user ? .red:.blue)
        }.onAppear(perform: {
            viewModel.conect()
        })
        Spacer()
        HStack {
            TextField("Digite uma mensagem...", text: $viewModel.newMessage)
            Button {
                viewModel.sendMessage()
                viewModel.newMessage = ""
            } label: {
                Text("Enviar")
            }
        }
        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
    }
}

#Preview {
    HomeView()
}
