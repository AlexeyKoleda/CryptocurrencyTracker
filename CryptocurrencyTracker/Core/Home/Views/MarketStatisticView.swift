//
//  MarketStatisticView.swift
//  CryptocurrencyTracker
//
//  Created by Alexey Koleda on 21.12.2021.
//

import SwiftUI

struct MarketStatisticView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.statistics) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width,
               alignment: showPortfolio ? .trailing : .leading)
    }
}

struct MarketStatisticView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MarketStatisticView(showPortfolio: .constant(false))
                .padding()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            MarketStatisticView(showPortfolio: .constant(true))
                .padding()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
        .environmentObject(dev.homeVM)
       
    }
}
