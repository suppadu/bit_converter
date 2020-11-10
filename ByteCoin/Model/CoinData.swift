//
//  CurrencyJSON.swift
//  ByteCoin
//
//  Created by Дмитрий Константинов on 25.10.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","INR","JPY","NZD","PLN","RUB","SEK","SGD","USD"]

struct CoinData: Decodable {
    let AUD: CurrencyValue
    let BRL: CurrencyValue
    let CAD: CurrencyValue
    let CNY: CurrencyValue
    let EUR: CurrencyValue
    let GBP: CurrencyValue
    let HKD: CurrencyValue
    let INR: CurrencyValue
    let JPY: CurrencyValue
    let NZD: CurrencyValue
    let PLN: CurrencyValue
    let RUB: CurrencyValue
    let SEK: CurrencyValue
    let SGD: CurrencyValue
    let USD: CurrencyValue
}

struct CurrencyValue: Decodable {
    let sell: Double
    let symbol: String
}
