//
//  NewWalletView.swift
//  Vaultz
//
//  Created by Ashwin Balasubramanian on 10/16/19.
//  Copyright © 2019 Ashwin Balasubramanian. All rights reserved.
//

import SwiftUI

struct NewWalletView: View {
    @State var showNewAddress: Bool = false
    var body: some View {
        VStack{
            Button(action: {self.showNewAddress = true}){
                Text("Create a new wallet")
            }.sheet(isPresented: self.$showNewAddress){
                NewAddress()
            }
            Text("OR")
            Button(action: {}){Text("Add an existing wallet")}
        }
    }
}

struct NewWalletView_Previews: PreviewProvider {
    static var previews: some View {
        NewWalletView()
    }
}
