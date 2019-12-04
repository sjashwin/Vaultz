//
//  Curl.swift
//  Vaultz
//
//  Created by Ashwin Balasubramanian on 10/11/19.
//  Copyright © 2019 Ashwin Balasubramanian. All rights reserved.
//

import Foundation
struct USDValue{
    var value: Double
}

class CoinmarketCap{
    let coinmarketcap: String = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest"
    var data: Data?
    var response: AssetData?
    var quoteUSD: Double
    var quoteCur: String?
    var semaphore: DispatchSemaphore
    private let API_KEY: String
    init(usd Double, quoteCur String){
        self.API_KEY = "fb635747-af48-4185-b125-8d889257ab20"
        self.quoteUSD = usd
        self.quoteCur = quoteCur
        self.semaphore = DispatchSemaphore(value: 0)
        self.connect().resume()
        _ = self.semaphore.wait(timeout: .distantFuture)
    }
    
    // packages the url
    // Swift does not allow http body with get type. Therefore, the requirement of URLComponents
    func packageURL()->URL?{
        var urlComponents = URLComponents(string: self.coinmarketcap)
        urlComponents?.queryItems = [
            URLQueryItem(name:"symbol", value: "KMD"),
        ]
        return urlComponents?.url
    }
    
    // Generates a url request
    func getRequest()->URLRequest{
        var request = URLRequest(url: packageURL()!)
        request.httpMethod = "Get"
        request.setValue(self.API_KEY, forHTTPHeaderField: "X-CMC_PRO_API_KEY")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
    
    // connect to the API.
    func connect()->URLSessionTask{
        let req = getRequest()
        return URLSession.shared.dataTask(with: req){
            (data, response, error) in
            if let error = error{
                print("error: \(error)")
            }else{
                if let response=response as? HTTPURLResponse{
                    if response.statusCode != 200{
                        print("Could not connect to coinmaket cap api \(response)")
                    }
                }
                if let data = data{
                    self.data = data
                    self.getData()
                    self.semaphore.signal()
                }
            }
        }
    }
    
    // Gets the usd valur from coinmarketcap response. Decodes response to json.
    func getData(){
        do{
            let decoder = JSONDecoder()
            self.response = try decoder.decode(AssetData.self, from: self.data!)
            self.quoteUSD = self.response!.data.KMD.quote.USD.price
        }catch{print("Decoding JSON: \(error)")}
    }
}
