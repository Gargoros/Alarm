//
//  SwitchButtonView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 9.02.24.
//

import SwiftUI

struct SwitchButtonView: View {
    //MARK: - Variables
    @Binding var isOn: Bool
    let factor: CGFloat = 59.0 / 35.0
    let innerCircleFactor: CGFloat = 59.0 / 25.0
    let offsetDelta: CGFloat = 12.0
    var width: CGFloat = 35.0
    
    var sign: Double {
        return isOn ? 1.0 : -1.0
    }
    var xShift: Double {
        return sign * offsetDelta
    }
    var backgroundWhiteness: Double {
        var result = xShift + offsetDelta
        result = result / (2 * offsetDelta)
        // Normalize
        result = result * 0.5
        // Change the rngrom 0 to 0.5
        // flip result, i.e. 0 -> 0.5 and
        // 0.5 -> 0
        result = 0.5 - result
        return result
    }
    var textColor: Color {
        return isOn ? Color.appColorLightGray : Color.appColorBlack
    }
    var onOffText: LocalizedStringKey {
        return isOn ? "on" : "off"
    }
    
    //MARK: - Views
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged{gesture in
                withAnimation(.easeIn(duration: 0.2)){
                    isOn = gesture.translation.width > 0 ? true : false}
            }
        let tapGesture = TapGesture()
            .onEnded{ _ in
                withAnimation(.easeIn(duration: 0.2)){
                    isOn.toggle()
                }
            }
        let combinedGesture = dragGesture.simultaneously(with: tapGesture)
        
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .fill(
                    Color(white: backgroundWhiteness)
                )
            ShiftedTextView(
                text: onOffText,
                color: textColor,
                xShift: -xShift
            )
            ShiftedCircle(xShift: xShift)
            
        }
        .frame(
            width: width * factor + 8,
            height: width,
            alignment: .leading
        )
        .gesture(combinedGesture)
    }
}

#Preview {
    VStack {
        SwitchButtonView( isOn: .constant(true))
        SwitchButtonView( isOn: .constant(false))
    }
}
