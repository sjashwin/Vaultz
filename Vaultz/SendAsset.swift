//
//  SendAsset.swift
//  Vaultz
//
//  Created by Ashwin Balasubramanian on 10/26/19.
//  Copyright © 2019 Ashwin Balasubramanian. All rights reserved.
//

import Foundation

class Send{
    
    var connection: Curl
    var send: SendToAddress
    init(config: Configuration){
        self.connection = Curl(config: config)
        self.send = SendToAddress()
        self.connection.request(&self.send)
    }
    
    func getResult()->String?{
        return self.send.result
    }
}
