//
//  ServerConfiguration.swift
//  Vaultz
//
//  Created by Ashwin Balasubramanian on 10/16/19.
//  Copyright © 2019 Ashwin Balasubramanian. All rights reserved.
//

import SwiftUI

struct ServerConfiguration: View {
    @State private var name: String = "user"
    @State private var password: String = "pass"
    @State private var port: String = "port"
    @State private var hostname: String = "hostname"
    var body: some View{
         NavigationView{
                   VStack{
                       HStack{
                           Text("Username:")
                           TextField("username", text: $name)
                               .textContentType(UITextContentType.name)
                       }
                       HStack{
                           Text("Password:")
                           SecureField("password", text: $password)
                       }
                       HStack{
                           Text("Port:")
                           TextField("port", text: $port)
                       }
                       HStack{
                           Text("Hostname:")
                           TextField("hostname:", text: $hostname)
                       }
                       Button(action:{print("clicked")}, label:{Text("update")})
                   }
                   

               }
    }
}

struct ServerConfiguration_Previews: PreviewProvider {
    static var previews: some View {
        ServerConfiguration()
    }
}
