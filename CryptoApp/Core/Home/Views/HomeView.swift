//
//  HomeView.swift
//  CryptoApp
//
//  Created by Alexis Horteales Espinosa on 06/10/26.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false //animate right
    @State private var showPortfolioView: Bool = false //new sheet
    @State private var selectedCoin: CoinModel? = nil
    @State private var showDetailView: Bool = false
    @State private var showSettingsView: Bool = false
   
    var body: some View {
        ZStack{
            //background layer
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView) {
                    PortfolioView()
                        .environmentObject(vm)
                }
            
            //content layer
            VStack{
                headerHome
                HomeStatsView( showPortfolio: $showPortfolio)
                SearchBarView(searchText: $vm.searchText)
                columnTitles
                
                
                if !showPortfolio{
                    allCoinsList
                    .transition(.move(edge: .leading))
                }
                
                if showPortfolio{
                    ZStack(alignment: .top){
                        if vm.portfolioCoins.isEmpty && vm.searchText.isEmpty{
                            portfolioEmptyText
                        } else {
                            portfolioCoinsList
                                .transition(.move(edge: .trailing))
                        }
                    }
                }
            
                Spacer(minLength: 0)
            
            }
            .sheet(isPresented: $showPortfolio) {
                SettingsView()
            }
        }
        .background {
            Color.clear
                .navigationDestination(isPresented: $showDetailView) {
                    DetailLoadingView(coin: $selectedCoin)
                }
        }
    }
    
    
}

#Preview {
    NavigationStack {
        HomeView()
            .navigationBarBackButtonHidden(true)
            .environmentObject(HomeViewModel())
        }
    }


    


extension HomeView{
    private var headerHome: some View{
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus" : "info" )
                .animation(.none)
                .onTapGesture {
                    if showPortfolio{
                        showPortfolioView.toggle()
                    } else {
                        showSettingsView.toggle()
                    }
                }
            
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(.none)
            Spacer()
            
            
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()){
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList: some View{
        List{
            ForEach(vm.allCoins){ coin in
                CoinRowView(coin: coin, showHoldingColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 0, trailing: 10))
                    .onTapGesture {
                        segue(coin: coin)
                    }
                
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var portfolioCoinsList: some View{
        List{
            ForEach(vm.portfolioCoins){ coin in
                CoinRowView(coin: coin, showHoldingColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 0, trailing: 10))
                    .onTapGesture {
                        segue(coin: coin)
                    }
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var portfolioEmptyText: some View {
        VStack(spacing: 12) {
            Image(systemName: "chart.line.uptrend.xyaxis")
                .font(.system(size: 35, weight: .light))
                .foregroundColor(Color.theme.accent)

            Text("Your portfolio is looking a little empty")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)

            Text("Start building your portfolio by adding your favorite cryptocurrencies. Tap the + button to get started.")
                .font(.callout)
                .foregroundColor(Color.theme.secondaryText)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
        }
        .padding(30)
        .frame(maxWidth: .infinity)
    }
    
    private func segue(coin: CoinModel){
        selectedCoin = coin
        showDetailView.toggle()
    }
    
    private var columnTitles: some View{
        
        HStack{
            HStack(spacing: 4){
                Text("Coin")
                Image(systemName: "chevron.down")
                    .opacity(vm.sortOption == .rank || vm.sortOption == .rankReversed ? 1.0 : 0.0 )
                    .rotationEffect(Angle(degrees: vm.sortOption == .rank ? 0 : 180))
            }
            .onTapGesture {
                withAnimation(.default){
                    vm.sortOption = vm.sortOption == .rank ? .rankReversed : .rank
                }
            }
            
            Spacer()
            if showPortfolio{
                HStack(spacing: 4){
                    Text("Holdings")
                    Image(systemName: "chevron.down")
                        .opacity(vm.sortOption == .holdings || vm.sortOption == .holdingsReversed ? 1.0 : 0.0 )
                        .rotationEffect(Angle(degrees: vm.sortOption == .holdings ? 0 : 180))
                }
                .onTapGesture {
                    withAnimation(.default){
                        vm.sortOption = vm.sortOption == .holdings ? .holdingsReversed : .holdings
                    }
                }
                
            }
            
            HStack(spacing: 4){
                Text("Price")
                Image(systemName: "chevron.down")
                    .opacity(vm.sortOption == .price || vm.sortOption == .priceReversed ? 1.0 : 0.0 )
                    .rotationEffect(Angle(degrees: vm.sortOption == .price ? 0 : 180))
            }
            .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
            .onTapGesture {
                withAnimation(.default){
                    vm.sortOption = vm.sortOption == .price ? .priceReversed : .price
                }
            }
            
            
            Button{
                withAnimation(.linear(duration: 2.0)) {
                    vm.reloadData()
                }
            }label: {
                Image(systemName: "goforward")
            }
            .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0), anchor: .center)
        }
        .font(.caption)
        .foregroundStyle(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}


