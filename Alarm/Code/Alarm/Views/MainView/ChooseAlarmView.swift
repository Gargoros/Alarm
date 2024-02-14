//
//  WrapAddEditAlarmView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 13.02.24.
//

import SwiftUI

struct ChooseAlarmView: View {
    //MARK: - Variables
    @EnvironmentObject var lnManager: LocalNotificationManager
    @Binding var currentAlarmIndex: Int?
    @Binding var addEditViewType: AddEditViewType
    
    //MARK: - Views
    var body: some View {
        if let currentAlarmIndex = currentAlarmIndex{
            if addEditViewType == .standard {
                AddEditAlarmView(
                    alarmModel: lnManager.alarmViewModels[currentAlarmIndex],
                    currentAlarmIndex: currentAlarmIndex
                )
            }else{
                AddEditCircularAlarmView(
                    currentAlarmIndex: currentAlarmIndex,
                    alarmModel: lnManager.alarmViewModels[currentAlarmIndex])
            }
            
        } else {
            if addEditViewType == .standard {
                AddEditAlarmView(
                    alarmModel: AlarmModel.defaultAlarm(),
                    currentAlarmIndex: currentAlarmIndex)
            }
            else {
                AddEditCircularAlarmView(
                    currentAlarmIndex: currentAlarmIndex,
                    alarmModel: AlarmModel.defaultAlarm())
            }
            
        }
    }
}

#Preview {
    ChooseAlarmView(
        currentAlarmIndex: .constant(0),
        addEditViewType: .constant(AddEditViewType.circular)
        )
        .environmentObject(LocalNotificationManager())
}
