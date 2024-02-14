//
//  FourCoolCircles.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 7.02.24.
//

import SwiftUI

struct FourCoolCircles: View {
    //MARK: - Variables
    var color1: Color = Color.appColorDarkYellow
    var color2: Color = Color.appColorLightYellow
    
    @State private var offsetX: Array<CGFloat> = [0, 0, 0, 0]
    @State private var offsetY: Array<CGFloat> = [0, 0, 0, 0]
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    //MARK: - Views
    var body: some View {
        GeometryReader {geometry in
            
            let screenWidth: CGFloat = geometry.size.width
            let screenHeight: CGFloat = geometry.size.height
            
            ZStack(){
                
                CoolCircleView(
                    radius: screenWidth / 10,
                    color1: color1,
                    color2: color2.opacity(0.3)
                )
                .offset(x: screenWidth * 0.7, y: screenHeight * 0.5)
                .offset(x: offsetX[0], y: offsetY[0])
                
                CoolCircleView(
                    radius: screenWidth / 7,
                    color1: color1,
                    color2: color2.opacity(0.3)
                )
                .offset(x: screenWidth * 0.7, y: screenHeight * 0.1)
                .offset(x: offsetX[1], y: offsetY[1])
                
                CoolCircleView(
                    radius: screenWidth / 4,
                    color1: color1,
                    color2: color2.opacity(0.3)
                )
                .offset(x: screenWidth * 0.08, y: screenHeight * 0.7)
                .offset(x: offsetX[2], y: offsetY[2])
                
                CoolCircleView(
                    radius: screenWidth / 12,
                    color1: color1,
                    color2: color2.opacity(0.3)
                )
                .offset(x: screenWidth * 0.2, y: screenHeight * 0.3)
                .offset(x: offsetX[3], y: offsetY[3])
                
            }
            .onReceive(timer) { _ in
                withAnimation(.easeIn(duration: 30)){
                    for i in 0..<offsetX.count {
                        offsetX[i] = Double.random(in: -300...300)
                    }
                    for i in 0..<offsetY.count {
                        offsetY[i] = Double.random(in: -300...300)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    FourCoolCircles(color1: Color.appColorDarkYellow, color2: Color.appColorLightGray)
}
