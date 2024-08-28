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
                .padding(.top, 16)
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
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
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
