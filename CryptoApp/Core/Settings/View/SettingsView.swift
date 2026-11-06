//
//  SettingsView.swift
//  CryptoApp
//
//  Created by Alexis Horteales Espinosa on 03/11/26.
//

import SwiftUI

struct SettingsView: View {
    
    let binanceURL = URL(string: "https://api.binance.com/api/v3/ticker/price?symbol=BTCUSDT")!
    let krakenURL = URL(string: "https://api.kraken.com/0/public/Ticker?pair=XBTUSD")!
    let coinPaprikaURL = URL(string: "https://api.coinpaprika.com/v1/tickers/btc-bitcoin")!
    let github = URL(string: "https://github.com/alex-hort")!
    let coinGeckoAPIURL = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false")!
    
    var body: some View {
        NavigationStack{
            List{
                settingSection
                coinGeckoSection
                developerSection
                applicationSection
                
            }
            .font(.headline)
            .tint(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}

extension SettingsView{
    private var settingSection: some View{
        Section(header: Text("CRYPTO APP")) {
            VStack(alignment: .leading){
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app is a YouTube-guided project made possible by Swiftul Thinking")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Binance", destination: binanceURL)
            Link("Kraken", destination: krakenURL)
        }
    }
    
    private var coinGeckoSection: some View{
        Section(header: Text("CoinGecko")) {
            VStack(alignment: .leading){
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("Thanks for the CoinGeko API—life is easier with this data from MIE.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko", destination: binanceURL)
           
        }
    }
    
    private var developerSection: some View{
        Section(header: Text("Developer")) {
            VStack(alignment: .leading){
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was developed by Alexis Horteales")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Github", destination: github)
           
        }
    }
    private var applicationSection: some View{
        Section(header: Text("Application")) {
            Link("Terms of Service", destination: coinPaprikaURL)
            Link("Privacy Policy", destination: coinPaprikaURL)
            Link("Company Website", destination: coinPaprikaURL)
            Link("Learn More", destination: coinPaprikaURL)
        }
        
    }
}
