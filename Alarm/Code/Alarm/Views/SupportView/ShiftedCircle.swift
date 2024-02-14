//
//  ShiftedCircle.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 9.02.24.
//

import SwiftUI

struct ShiftedCircle: View {
    //MARK: - Variables
    var color: Color = Color.appColorBackgroundColor
    let xShift: Double
    var padding: Double = 7.0
    
    //MARK: - Views
    var body: some View {
        Circle()
            .fill(color)
            .padding(padding)
            .offset(x: xShift)
    }
}

#Preview {
    ShiftedCircle(xShift: 1.0)
}
