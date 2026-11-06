//
//  ContentView.swift
//  CryptoApp
//
//  Created by Alexis Horteales Espinosa on 05/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
            
            VStack(spacing: 40){
                Text("Accent color")
                    .foregroundStyle(Color.theme.red)
            }
            .font(.headline)
        }
    }
}

#Preview {
    ContentView()
}
