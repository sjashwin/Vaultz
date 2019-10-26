//
//  GetWalletInfo.swift
//  Vaultz
//
//  Created by Ashwin Balasubramanian on 10/26/19.
//  Copyright © 2019 Ashwin Balasubramanian. All rights reserved.
//

import Foundation

class GetWalletInformation{
    
    let METHOD: String = "getwalletinfo"
    var getwalletInfo: GetWalletInfo
    var connection: Curl
    var request: URLRequest
    init(config: Configuration){
        self.getwalletInfo = GetWalletInfo()
        self.connection = Curl(config: config)
        self.request = self.connection.getHttpRequest(method: .getwalletinfo, params: [String]())
        self.connection.request(request: self.request, &self.getwalletInfo)
    }
}
