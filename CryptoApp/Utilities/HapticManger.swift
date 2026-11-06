//
//  HapticManger.swift
//  CryptoApp
//
//  Created by Alexis Horteales Espinosa on 23/10/26.
//

import Foundation
import SwiftUI

class HapticManger{
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType ){
        generator.notificationOccurred(type)
    }
    
}
