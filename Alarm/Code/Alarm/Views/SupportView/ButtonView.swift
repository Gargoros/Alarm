//
//  ButtonView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 8.02.24.
//

import SwiftUI

struct ButtonView: View {
    //MARK: - Variables
    let text: LocalizedStringKey
    var endRadius: CGFloat = 40.0
    var scaleX: CGFloat = 3.0
    
    //MARK: - Views
    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .foregroundStyle(Color.appColorBlack)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                MainGradient(endRadius: endRadius, scaleX: scaleX)
            )
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    VStack(){
        ButtonView(text: LocalizedStringKey("add alarm"))
        ButtonView(text: LocalizedStringKey("next"))
        ButtonView(text: LocalizedStringKey("delete alarm"))
    }
    .padding()
}
