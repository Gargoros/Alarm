//
//  CoolTextView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 8.02.24.
//

import SwiftUI

struct CoolTextView: View {
    //MARK: - Variables
    let fontName: String = "WorkSans-VariableFont_wght"
    let text: LocalizedStringKey
    let size: CGFloat
    
    //MARK: - Views
    var body: some View {
        Text(text)
            .font(Font.custom(fontName, size: size))
            .foregroundStyle(Color.appColorBlack)
            .shadow(color: .black.opacity(0.15), radius: 3, x: 0, y: 0)
    }
}

#Preview {
    CoolTextView(text: "set alarm and\nwake up easily", size: 36)
}
