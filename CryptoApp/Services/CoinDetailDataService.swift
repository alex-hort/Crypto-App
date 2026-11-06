//
//  CoinDetailDataService.swift
//  CryptoApp
//
//  Created by Alexis Horteales Espinosa on 27/10/26.
//


import Foundation
import Combine


class CoinDetailDataService{
    
    @Published var coinDetails: CoinDetailModel? = nil
    var coinDetailsSuscription: AnyCancellable?
    
    let coin: CoinModel
    
    init(coin: CoinModel){
        self.coin = coin
        getCoinsDetails()
    }
    func getCoinsDetails(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else {return}
        
        coinDetailsSuscription = NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: {[weak self] returnedCoinsDetails in
                self?.coinDetails = returnedCoinsDetails
                self?.coinDetailsSuscription?.cancel()
            })
        
    }
}

