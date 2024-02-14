//
//  DisplayIconOnCircularTimeView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 12.02.24.
//

import SwiftUI

struct DisplayIconOnCircularTimeView: View {
    //MARK: - Variables
    let time: Date
    let size: CGFloat
    let percent: CGFloat
    
    var circleFrame: CGFloat = 40.0
    
    //MARK: - Views
    var body: some View {
        Circle()
            .fill(Color.appColorBackgroundColor)
            .frame(width: circleFrame, height: circleFrame)
            .shadow(color: Color.appColorBlack.opacity(0.5), radius: 1, x: 0.0, y: 1.0)
            .overlay(
                TimeOfDayIconView(date: time)
            )
            .rotation3DEffect(
                .degrees(-percent * 360),
                axis: (x: 0.0, y: 0.0, z: 1.0)
            )
            .offset(y: -size / 2)
            .rotation3DEffect(
                .degrees(percent * 360),
                axis: (x: 0.0, y: 0.0, z: 1.0)
            )
        
    }
}

#Preview {
    ZStack {
        Color.black.opacity(0.5)
            .ignoresSafeArea()
        DisplayIconOnCircularTimeView(
            time: Date(),
            size: 200,
            percent: 0.5)
    }
}
