//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didWithError(_ error: Error)
}

struct CoinManager {
    
    let baseURL = "https://blockchain.info/ticker"
    let valueURL = "https://blockchain.info/tobtc?value=1&"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","INR","JPY","NZD","PLN","RUB","SEK","SGD","USD"]
    var delegate: CoinManagerDelegate?

    func fetchBTCValue(_ row: Int) {
        let stringURL = "\(valueURL)currency=\(currencyArray[row])"
        performRequest(baseURL)
        
    }
    
    func performRequest(_ stringURL: String){
        if let url = URL(string: stringURL){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    delegate?.didWithError(error!)
                    return
                }
                
                if let safeData = data {
                    if let coin = parseJSON(safeData){
                        print(coin.symbol)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ coinData: Data) -> CoinModel? {
        
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(CoinData.self, from: coinData)
            let symbol = decodeData.AUD.symbol
//            let coin = CoinModel(value: valueBTC, symbol: symbol)
            return nil
            
        } catch {
            delegate?.didWithError(error)
            return nil
        }
    }
}
