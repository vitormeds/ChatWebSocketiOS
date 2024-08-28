import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        VStack {
            ScrollViewReader { scrollViewProxy in
                List(self.viewModel.messages) { message in
                    ChatMessageView(message: message, isSentByCurrentUser: message.user == viewModel.user)
                        .listRowSeparator(.hidden)
                        .id(message.id)
                }
                .onAppear(perform: {
                    viewModel.conect()
                })
                .listStyle(.plain)
                .padding(.top, 8)
                .onChange(of: viewModel.messages, {
                    if let lastMessage = viewModel.messages.last {
                        withAnimation {
                            scrollViewProxy.scrollTo(lastMessage.id, anchor: .bottom)
                        }
                    }
                })
            }

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
    }

    func sendMessage() {
        viewModel.sendMessage()
        viewModel.newMessage = ""
    }
}

#Preview {
    HomeView()
}
