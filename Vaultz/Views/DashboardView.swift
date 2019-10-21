//
//  DashboardView.swift
//  Vaultz
//
//  Created by Ashwin Balasubramanian on 10/11/19.
//  Copyright © 2019 Ashwin Balasubramanian. All rights reserved.
//

import SwiftUI

struct DashboardView: View {
    
    //let USDValue: Double = CoinmarketCap().quoteUSD
    let USDValue: Double = 1.65
    @State var wallets: [Wallet] = [
           Wallet(
            name: "wallet 1",
            address: "12938qioweuhoqweiuyr",
            balance: "230.00",
            assetType: "komodo"),
       ]
       var body: some View{
        NavigationView{
            VStack{
               Text("KMD 320")
                Text("$\(320.00*USDValue)")
                   .font(Font.headline)
                   .fontWeight(Font.Weight.light)
               List(wallets){
                wallet in NavigationLink(destination: WalletView(walletName: wallet.name, wallet: wallet)){Text(wallet.name)}
               }
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
