//
//  Color.swift
//  CryptoApp
//
//  Created by Alexis Horteales Espinosa on 05/10/26.
//

import Foundation
import SwiftUI


extension Color{
    static let theme = ColorTheme()
    static let launch = LaunchTheme()
}



struct ColorTheme{
    let accent = Color(.accent)
    let background = Color(.background)
    let green = Color(.green)
    let red = Color(.red)
    let secondaryText = Color(.secondaryText)
}


struct LaunchTheme
{
    let accent = Color(.launchAccent)
    let bc = Color(.launchBackground)
}
