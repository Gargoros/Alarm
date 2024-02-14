//
//  ShiftedTextView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 9.02.24.
//

import SwiftUI

struct ShiftedTextView: View {
    //MARK: - Variables
    let text: LocalizedStringKey
    let color: Color
    let xShift: Double
    
    
    //MARK: - Views
    var body: some View {
        Text(text)
            .foregroundStyle(color)
            .font(.system(size: 10))
            .fontWeight(.semibold)
            .offset(x: xShift)
    }
}

#Preview {
    ZStack{
        Color.black
        ShiftedTextView(text: "on", color: Color.appColorCardBackgroundColor,  xShift: 1.0)
    }
}
