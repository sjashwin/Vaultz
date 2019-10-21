//
//  NewWalletView.swift
//  Vaultz
//
//  Created by Ashwin Balasubramanian on 10/16/19.
//  Copyright © 2019 Ashwin Balasubramanian. All rights reserved.
//

import SwiftUI

struct NewWalletView: View {
    var body: some View {
        VStack{
            Button(action: {}){Text("Create a new wallet")}
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
