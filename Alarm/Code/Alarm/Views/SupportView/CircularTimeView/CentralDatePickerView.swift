//
//  CentralDatePickerView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 12.02.24.
//

import SwiftUI

struct CentralDatePickerView: View {
    //MARK: - Variables
    let size: CGFloat
    @Binding var alarmModel: AlarmModel
    
    var lineWidth: CGFloat = 10.0
    
    
    
    //MARK: - Views
    var body: some View {
        Circle()
            .stroke(Color.appColorLightGray, lineWidth: 10)
            .frame(width: size, height: size)
            .overlay(
                VStack{
                    VStack{
                        GrayedTextView(text: "start", font: .caption)
                        TimePickerView(time: $alarmModel.start.animation(), scale: 1.0)
                    }
                    Spacer()
                    GrayedTextView(text: "Set the alarm")
                        .minimumScaleFactor(0.8)
                    Spacer()
                    VStack{
                        TimePickerView(time: $alarmModel.end.animation(), scale: 1.0)
                        GrayedTextView(text: "end", font: .caption)
                    }
                }
                    .padding()
                    .padding(.vertical)
            )
    }
}

#Preview {
    CentralDatePickerView(size: 200, alarmModel: .constant(AlarmModel.defaultAlarm()))
}
