//
//  AddEditCircularAlarmView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 12.02.24.
//

import SwiftUI

struct AddEditCircularAlarmView: View {
    //MARK: - Variables
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    
    //MARK: - Views
    var body: some View {
        GeometryReader {geometry in
            VStack(){
                CancelSaveAlarmView(currentAlarmIndex: currentAlarmIndex, alarmModel: $alarmModel)
                AlarmToggleView(alarmEnabled: $alarmModel.alarmEnabled)
                Divider()
                Spacer()
                CircularTimeView(currentAlarmIndex: currentAlarmIndex, alarmModel: $alarmModel, size: geometry.size.width /  1.6)
                Spacer()
                SelectActivityViewExpanded(currentColorIndex: $alarmModel.colorIndex, currentActivity: $alarmModel.activity)
            }
            .padding()
        }
    }
}

#Preview {
    AddEditCircularAlarmView(currentAlarmIndex: nil, alarmModel: AlarmModel.defaultAlarm())
}
