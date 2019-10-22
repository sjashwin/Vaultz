//
//  NewAddress.swift
//  Vaultz
//
//  Created by Ashwin Balasubramanian on 10/21/19.
//  Copyright © 2019 Ashwin Balasubramanian. All rights reserved.
//

import SwiftUI

struct NewAddress: View {
    @Environment(\.presentationMode) var presentation
    private var address: String? = getAddress()
    var body: some View {
        NavigationView{
            if address != nil{
                VStack{
                    Button(action:{
                        self.presentation.wrappedValue.dismiss()
                    }){Text("Done")}
                   Success(address: address!)
                    
                }
                .navigationBarTitle(Text("New Address"))
            }else{
                VStack{
                    NewError(errorDescription: "Error: Could not create a new address")
                    Button("Done"){
                        self.presentation.wrappedValue.dismiss()
                    }
                }
                .navigationBarTitle(Text("New Address"))
            }
        }
    }
}

func getAddress()->String?{
    let connection = Curl(
        hostname: "127.0.0.1",
        username: "user",
        password: "pass",
        port: 7771
    )
    var newAddress: GetNewAddress = GetNewAddress()
    connection.request(&newAddress)
    return newAddress.address
}

struct NewError: View{
    @State var errorDescription: String
    var body: some View{
        Text(errorDescription)
    }
}

struct Success: View{
    @State var address: String
    var body: some View{
        VStack{
            Text("Congratulations! we have created a new address for you.")
            Text(address)
            Button("Done", action: {})
        }
    }
}
struct NewAddress_Previews: PreviewProvider {
    static var previews: some View {
        NewAddress()
    }
}
