//
//  SearchBarView.swift
//  CryptocurrencyTracker
//
//  Created by Alexey Koleda on 20.12.2021.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ?
                    Color.theme.secondaryText : Color.theme.accent
                )
            
            TextField("Search by name or symbol...", text: $searchText)
                .foregroundColor(Color.theme.accent)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10.0)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .foregroundColor(Color.theme.accent)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    , alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.theme.backgound)
                .shadow(color: Color.theme.accent.opacity(0.15),
                        radius: 10, x: 0.0, y: 0.0)
        )
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchBarView(searchText: .constant(""))
                .padding()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            SearchBarView(searchText: .constant(""))
                .padding()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
