//
//  XmarkButton.swift
//  CryptocurrencyTracker
//
//  Created by Alexey Koleda on 22.12.2021.
//

import SwiftUI

struct XmarkButton: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "xmark.circle")
                .font(.headline)
        })
    }
}

struct XmarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XmarkButton()
    }
}
