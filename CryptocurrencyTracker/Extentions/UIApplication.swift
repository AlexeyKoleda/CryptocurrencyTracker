//
//  UIApplication.swift
//  CryptocurrencyTracker
//
//  Created by Alexey Koleda on 20.12.2021.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    /// Closes keyboard when clearing search bar
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
