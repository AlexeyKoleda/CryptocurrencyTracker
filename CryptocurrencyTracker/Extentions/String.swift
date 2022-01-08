//
//  String.swift
//  CryptocurrencyTracker
//
//  Created by Alexey Koleda on 08.01.2022.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
