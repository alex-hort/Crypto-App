//
//  XMarkButton.swift
//  CryptoApp
//
//  Created by Alexis Horteales Espinosa on 21/10/26.
//

import SwiftUI

struct XMarkButton: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button {
            dismiss()
        } label: {
            
            Image(systemName: "xmark")
                .font(.headline)

        }
    }
}

#Preview {
    XMarkButton()
}
