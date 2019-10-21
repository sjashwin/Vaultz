//
//  JsonStructures.swift
//  Vaultz
//
//  Created by Ashwin Balasubramanian on 10/12/19.
//  Copyright © 2019 Ashwin Balasubramanian. All rights reserved.
//

import Foundation

struct AssetData: Codable{
    struct Status: Codable{
        let timestamp: String
        let error_code: Int
        let error_message: String?
        let elapsed: Int
        let credit_count: Int
        let notice: String?
    }
    struct Data: Codable{
        let KMD: Asset
        struct Asset: Codable{
            let id: Int
            let name: String
            let symbol: String
            let slug: String
            let num_market_pairs: Int
            let date_added: String
            let tags: [String]
            let max_supply: Int64
            let circulating_supply: Double
            let total_supply: Double
            let platform: String?
            let cmc_rank: Int
            let last_updated: String
            let quote: Quote
            struct Quote: Codable{
                let USD: Fiat
                struct Fiat: Codable{
                    let price: Double
                    let volume_24h: Double
                    let percent_change_1h: Double
                    let percent_change_24h: Double
                    let percent_change_7d: Double
                    let market_cap: Double
                    let last_updated:String
                }
            }
        }
    }
    let status: Status
    let data: Data
}
