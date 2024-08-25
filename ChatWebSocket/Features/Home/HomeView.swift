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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear(perform: {
                viewModel.conect()
            })
    }
}

#Preview {
    HomeView()
}
