//
//  Router.swift
//  ChatWebSocket
//
//  Created by Vitor Mendes on 25/08/24.
//

import Foundation
import SwiftUI

class Router: ObservableObject {
    
    enum Destination: Hashable {
        case home
    }
    
    @Published var navPath = NavigationPath()
        
    func routeTo(_ destination: Destination) {
        navPath.append(destination)
    }
    
    func popToPrevious() {
        navPath.removeLast()
    }
    
    func popScreens(_ amount: Int) {
        navPath.removeLast(amount)
    }
    
    func popToRoot() {
        navPath = NavigationPath()
    }
}

