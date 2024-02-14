//
//  MainGradient.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 8.02.24.
//

import SwiftUI

struct MainGradient: View {
    //MARK: - Variables
    var startRadius: CGFloat = 0.0
    var endRadius: CGFloat
    var scaleX: CGFloat = 2.0
    var opacityLinGrad: CGFloat = 0.5
    var opacityRadGrad: CGFloat = 1.0
    var yellowColor: Color = Color.appColorYellow
    
    //MARK: - Views
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.appColorBlue, Color.appColorBlue, Color.appColorPink],
                startPoint: .top,
                endPoint: .bottom)
            .opacity(opacityLinGrad)
            .ignoresSafeArea()
            RadialGradient(
                colors: [Color.appColorYellow, .clear],
                center: .bottom,
                startRadius: startRadius,
                endRadius: endRadius)
            .opacity(opacityRadGrad)
            .scaleEffect(x: scaleX)
            .ignoresSafeArea()
        }
        
    }
}

#Preview {
    MainGradient(endRadius: 75)
}
