//
//  CircleButtonView.swift
//  CryptocurrencyTracker
//
//  Created by Alexey Koleda on 15.12.2021.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.backgound))
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10, x: 0.0, y: 0.0)
            .padding()
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleButtonView(iconName: "heart.fill")
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            
            CircleButtonView(iconName: "heart.fill")
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
