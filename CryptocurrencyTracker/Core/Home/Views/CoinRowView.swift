//
//  CoinRowView.swift
//  CryptocurrencyTracker
//
//  Created by Alexey Koleda on 15.12.2021.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: Coin
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            currencyInfo
            Spacer()
            if showHoldingsColumn {
                currencyHaldings
            }
            currencyPrice
        }
        .font(.subheadline)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowView(coin: dev.coin, showHoldingsColumn: false)
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}

extension CoinRowView {
    
    private var currencyInfo: some View  {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 8)
                .foregroundColor(Color.theme.accent)
        }
    }
    
    private var currencyHaldings: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(Color.theme.accent)
    }
    
    private var currencyPrice: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundColor(Color.theme.accent)
            Text(coin.priceChangePercentage24H.asPercentString())
                .foregroundColor(
                    (coin.priceChangePercentage24H) >= 0 ?
                    Color.theme.green : Color.theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
    
}
