//
//  CircularTimeView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 12.02.24.
//

import SwiftUI

struct CircularTimeView: View {
    //MARK: - Variables
    let currentAlarmIndex: Int?
    @Binding var alarmModel: AlarmModel
    
    let size: CGFloat
    
    var startTime: Date {
        return alarmModel.start
    }
    var endTime: Date {
        return alarmModel.end
    }
    var startDateToPrecent: CGFloat {
        return dateToPrecent(date: startTime)
    }
    var endDateToPrecent: CGFloat {
        return startDateToPrecent + precentDifference
    }
    var precentDifference: CGFloat {
        let value = dateToPrecent(date: endTime) - dateToPrecent(date: startTime)
        return value > 0 ? value : 1 + value
    }
    var rotateCircleOffset: CGFloat {
        return 360 * startDateToPrecent
    }
    
    //MARK: - Views
    var body: some View {
        ZStack {
            
            CentralDatePickerView(size: size, alarmModel: $alarmModel)
            
            //MARK: - Progression - black curve
            TimeArcView(
                precentDifference: precentDifference,
                strokeStyle: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round),
                size: size,
                rotateCircleOffset: rotateCircleOffset,
                color: Color.black)
            
            //MARK: - Progression - gray ticks
            TimeArcView(
                precentDifference: precentDifference,
                strokeStyle: StrokeStyle(lineWidth: 15, dash: [1, 2]),
                size: size,
                rotateCircleOffset: rotateCircleOffset,
                color: Color.gray)
            
            //MARK: - First Icon
            DisplayIconOnCircularTimeView(time: startTime, size: size, percent: startDateToPrecent)
            
            //MARK: - Second Icon
            DisplayIconOnCircularTimeView(time: endTime, size: size, percent: endDateToPrecent)
        }
    }
}

#Preview {
    CircularTimeView(
        currentAlarmIndex: nil,
        alarmModel: .constant(AlarmModel.defaultAlarm()),
        size: 250)
}
