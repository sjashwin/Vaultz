//
//  Wallet.swift
//  Vaultz
//
//  Created by Ashwin Balasubramanian on 10/12/19.
//  Copyright © 2019 Ashwin Balasubramanian. All rights reserved.
//

import SwiftUI

struct WalletView: View {
    var walletName: String
    @State var wallet: Wallet
    var body: some View {
        NavigationView{
            VStack{
                Text("Address:\(wallet.address)")
                Text("balance: KMD \(wallet.balance)")
                HStack{
                    Button(action:{print("clicked")}, label: {Text("Send")})
                    Button(action: {print("clicked receive")}, label: {Text("Receive")})
                }
            }
            .navigationBarItems(leading: Text(walletName))
        }
    }
}

struct WalletView_Previews: PreviewProvider{
    static var previews: some View{
        WalletView(walletName: "wallet 1", wallet: Wallet(name: "wallet 1", address: "12398237lkdjowieulksdnsdifj", balance: "230.00", assetType: "KMD"))
    }
}
