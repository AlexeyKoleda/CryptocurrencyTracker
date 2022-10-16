//
//  HapticManager.swift
//  CryptocurrencyTracker
//
//  Created by Alexey Koleda on 04.01.2022.
//

import Foundation
import SwiftUI

final class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
    
}
