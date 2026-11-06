//
//  PreviewProvider.swift
//  CryptoApp
//
//  Created by Alexis Horteales Espinosa on 09/10/26.
//

import Foundation
import SwiftUI


extension PreviewProvider{
    static var dev: DeveloperPreview{
        return DeveloperPreview.instance
    }
}

class DeveloperPreview{
    static let instance = DeveloperPreview()
    private init(){}
    
    let homeVM = HomeViewModel()
    
    let state1 = StatisticModel(title: "Market Cap", value: "$12.5Bn", percentageChange: 25.34)
    let state2 = StatisticModel(title: "Total Value", value: "$1.23Tr")
    let state3 = StatisticModel(title: "Portfolio Value", value: "$50.5k", percentageChange: -12.34)
    
    let coin = CoinModel(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png",
        currentPrice: 82682.83,
        marketCap: 1661561970574.0,
        marketCapRank: 1.0,
        fullyDilutedValuation: 1661575117143.0,
        totalVolume: 31384625282.29,
        high24H: 83398.38,
        low24H: 80426.95,
        priceChange24H: 1384.0,
        priceChangePercentage24H: 1.7,
        marketCapChange24H: nil,
        marketCapChangePercentage24H: nil,
        circulatingSupply: 20096000.0,
        totalSupply: 20096000.0,
        maxSupply: 21000000.0,
        ath: 126080.0,
        athChangePercentage: -34.4,
        athDate: "2025-10-06T18:00:00.000Z",
        atl: 67.81,
        atlChangePercentage: 121813.5,
        atlDate: nil,
        lastUpdated: "2026-10-09T23:00:00.000Z",
        sparklineIn7D: nil,
        priceChangePercentage24HInCurrency: 1.7,
        currentHoldings: 0.5
    )
}
