//
//  inventoryApp.swift
//  inventory
//
//  Created by Rinaldi on 21/05/22.
//

import SwiftUI


@main
struct inventoryApp: App {
    @Environment(\.scenePhase) private var scenePhase
    @ObservedObject var loginVM: LoginViewModel = LoginViewModel()
    
    init() {
        
    }

    var body: some Scene {
        WindowGroup {
            if loginVM.isAuthenticate == false {
                LoginView()
                    .environmentObject(loginVM)
            } else {
                DashboardView()
                    .environmentObject(loginVM)
            }
        }.onChange(of: scenePhase) { phase in
            switch phase {
                case .active:
                    print("active")
                case .inactive:
                    print("inactive")
                case .background:
                    print("background")
                @unknown default:
                    print("unknown")
            }
        }
    }
}
