//
//  CoolCircleView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 7.02.24.
//

import SwiftUI

struct CoolCircleView: View {
    //MARK: - Variables
    let radius: CGFloat
    var color1: Color = Color.appColorYellow
    var color2: Color = Color.clear
    
    //MARK: - Views
    var body: some View {
        Circle()
            .fill(
                LinearGradient(
                    colors: [color1, color2],
                    startPoint: .top,
                    endPoint: .bottom)
            )
            .frame(width: radius, height: radius)
    }
}

#Preview {
    CoolCircleView(radius: 12)
}
