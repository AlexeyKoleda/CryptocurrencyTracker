//
//  DetailView.swift
//  CryptocurrencyTracker
//
//  Created by Alexey Koleda on 07.01.2022.
//

import SwiftUI

struct DetailLoadingView: View {
    
    @Binding var coin: Coin?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}

struct DetailView: View {
    
    @StateObject private var vm: DetailViewModel
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    private let spacing: CGFloat = 30
    

    init(coin: Coin) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ChartView(coin: vm.coin)
                
                overviewTitle
                Divider()
                overviewGrid
                
                additionalTitle
                Divider()
                additionalGrid
            }
            .padding()
        }
        .navigationTitle(vm.coin.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                navbarTrailingItems
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                DetailView(coin: dev.coin)
            }
            .preferredColorScheme(.light)
            NavigationView {
                DetailView(coin: dev.coin)
            }
            .preferredColorScheme(.dark)
        }
    }
}

extension DetailView {
    
    private var navbarTrailingItems: some View {
        HStack {
            Text(vm.coin.symbol.uppercased())
                .font(.headline)
                .foregroundColor(Color.theme.secondaryText)
            CoinImageView(coin: vm.coin)
                .frame(width: 25, height: 25)
        }
    }
    
    private var overviewTitle: some View {
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var additionalTitle: some View {
        Text("Additional details")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var overviewGrid: some View {
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: spacing,
            pinnedViews: [],
            content: {
                ForEach(vm.overviewStatistics) { stat in
                    StatisticView(stat: stat)
                }
        })
    }
    
    private var additionalGrid: some View {
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: spacing,
            pinnedViews: [],
            content: {
                ForEach(vm.additionalStatistics) { stat in
                    StatisticView(stat: stat)
                }
        })
    }
}
