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

// Response codables
struct Response{
    var result: Any
    var error: String?
    var id: String = "curltest"
}

/*
 * API Json structures. These structures are used to encode and decode http responses.
 * All these API conform to the API specs in the komodo documentation.
*/

// GetNewAddress - The `getnewaddress` method returns a new address for receiving payments.
struct GetNewAddress: Codable{
    var address: String
}

// GetWalletInfo - The `getwalletinfo` returns the wallet method returns an obejct containing
// various information about the wallet state.
struct GetWalletInfo: Codable{
    var walletversion: Int64
    var balance: Double
    var unconfirmed_balance: Int64
    var immature_balance: Double
    var txaccount: Int
    var keypoololdest: Int64
    var keypoolsize: Int64
    var paytxfee: Int64
}

// SendToAddress - The `sendtoaddress` method sends an amount to a given address. The amount is real and is rounded to the neares
// 0.0000001
struct SendToAddress: Codable{
    var result: String
    var error: String?
    let id: String = "curltest"
}

// GetBalance - The `getbalance` method returns the server's totla available balance
struct GetBalance: Codable{
    var result: Double
    var error: String?
    let id: String = "curltest"
}

// GetTransactions - The `gettransactions` method queries detailed information about transaction `txid`. This
// command applies only to `txid``s that are in the user's local wallet.
struct GetTransactions: Codable{
    var amount: Double
    var rawconfirmations: Int
    var confirmations: Int
    var blockhash: String
    var blockindex: Int
    var blocktime: Int64
    var expiryheight: Int64
    var txid: String
    var walletconflicts: [String]
    var time: Int64
    var timereceived: Int64
    var  details: [TransactionDetails]
    var hex: String
}

struct TransactionDetails: Codable{
    var account: String
    var address: String
    var category: String
    var amount: Double
    var vout: Int
    var size: Int
}

// GetUnconfirmedBalance - the `getunconfirmedbalance` method returns the server's total unconfirmed balance.
struct GetUnconfirmedBalance: Codable{
    var result: Double
    var error: String
    let id: String = "curltest"
}

// ValidateAddress - The `validateaddress` method returns information about the given address.
struct ValidateAddress: Codable{
    var istruct: Bool
    var address: String
    var scriptPubKey: String
    var segid: Int64
    var ismine: Bool
    var iswatchonly: Bool
    var isscript: Bool
    var pubkey: String
    var iscompressed: Bool
    var account: String
}
