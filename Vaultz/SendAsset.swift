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
    var METHOD: String = "sendtoaddress"
    var request: URLRequest
    init<U: Codable>(config: Configuration, params: [U]){
        self.connection = Curl(config: config)
        self.send = SendToAddress()
        self.request = self.connection.getHttpRequest(
            method: METHOD,
            params: params)
        self.connection.request(request: self.request, &self.send)
    }
    
    func getResult()->String?{
        return self.send.result
    }
}
