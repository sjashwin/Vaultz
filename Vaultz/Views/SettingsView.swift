//
//  SettingsView.swift
//  Vaultz
//
//  Created by Ashwin Balasubramanian on 10/11/19.
//  Copyright © 2019 Ashwin Balasubramanian. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @State var screen: String
    @State var faceID: Bool = false
    var body: some View{
        NavigationView{
            List{
                NavigationLink(destination: ServerConfiguration()){
                    Text("Server Configuration")
                }
                NavigationLink(destination: Text("About")){
                   Text("About")
                }
                Toggle(isOn: $faceID){
                    Text("Face ID")
                }
            }
            .navigationBarTitle(Text(screen))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(screen: "Settings")
    }
}
