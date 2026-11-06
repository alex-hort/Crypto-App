//
//  String.swift
//  CryptoApp
//
//  Created by Alexis Horteales Espinosa on 02/11/26.
//


import Foundation

extension String{
    
    var removingHTMLOcurrances: String{
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
