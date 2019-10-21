//
//  Security.swift
//  Vaultz
//
//  Created by Ashwin Balasubramanian on 10/15/19.
//  Copyright © 2019 Ashwin Balasubramanian. All rights reserved.
//

import Foundation
import LocalAuthentication

class Security{
    let reason: String = "Local authentication keeps your account more secure."
    let context: LAContext = LAContext()
    var error: NSError?
    init(){
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error){
            // All requirements for local authentication are satisified.
            self.authenticate()
        }
    }
    
    func authenticate(){
        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason){ success, error in
            if success {
                // Successfully authenticated
            }else{
                // Could not authenticate
            }
        }
    }
}
