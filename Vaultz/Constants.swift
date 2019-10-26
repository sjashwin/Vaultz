//
//  Constants.swift
//  Vaultz
//
//  Created by Ashwin Balasubramanian on 10/26/19.
//  Copyright © 2019 Ashwin Balasubramanian. All rights reserved.
//

import Foundation

enum Methods: String{
    case getbalance = "getbalance"
    case getwalletinfo = "getwalletinfo"
}

extension RawRepresentable where RawValue == String{
    var descrption: String{
        return rawValue
    }
}
