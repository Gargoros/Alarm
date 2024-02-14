//
//  TimeArcView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 12.02.24.
//

import SwiftUI

struct TimeArcView: View {
    //MARK: - Variables
    let precentDifference: CGFloat
    let strokeStyle: StrokeStyle
    let size: CGFloat
    let rotateCircleOffset: CGFloat
    let color: Color
    
    //MARK: - Views
    var body: some View {
        Circle()
            .trim(from: 0.0, to: precentDifference)
            .stroke(style: strokeStyle)
            .foregroundStyle(color)
            .frame(width: size, height: size)
            .rotationEffect(.degrees(-90.0))
            .rotationEffect(.degrees(rotateCircleOffset))
    }
}

#Preview {
    TimeArcView(
        precentDifference: 0.5,
        strokeStyle: StrokeStyle(lineWidth: 15, dash: [1, 2]),
        size: 200,
        rotateCircleOffset: 30,
        color: Color.appColorNickel)
}
