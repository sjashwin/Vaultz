//
//  ContentView.swift
//  Vaultz
//
//  Created by Ashwin Balasubramanian on 10/11/19.
//  Copyright © 2019 Ashwin Balasubramanian. All rights reserved.
//

import SwiftUI

struct Wallet: Identifiable{
    let id: UUID = UUID()
    var name: String
    var address: String
    var balance: String
    var assetType: String
}

struct ContentView: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection){
            // Dashboard view
            DashboardView()
                .tabItem {
                    VStack {
                        Image("first")
                        Text("First")
                    }
                }
                .tag(0)
            // Settings view
            SettingsView(screen: "Settings")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Settings")
                    }
                }
                .tag(1)
            NewWalletView()
                .font(.title)
                .tabItem{
                    VStack{
                        Image("second")
                        Text("+")
                    }
            }
        .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
