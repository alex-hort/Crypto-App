//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Alexis Horteales Espinosa on 16/10/26.
//

import Foundation
import SwiftUI

extension UIApplication{
    
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
