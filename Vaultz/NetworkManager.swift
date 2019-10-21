//
//  NetworkManager.swift
//  Vaultz
//
//  Created by Ashwin Balasubramanian on 10/15/19.
//  Copyright © 2019 Ashwin Balasubramanian. All rights reserved.
//

import Foundation
import Network

class NetworkManager{
    let pathMonitor: NWPathMonitor = NWPathMonitor()
    
    init(){
        pathMonitor.pathUpdateHandler = {
            path in
            if path.status == .satisfied{
                print("Connected to network")
            }else{
                print("Not connected to the internet.")
            }
        }
        pathMonitor.start(queue: DispatchQueue.main)
    }
}
