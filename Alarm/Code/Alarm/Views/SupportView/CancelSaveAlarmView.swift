//
//  CancelSaveAlarmView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 9.02.24.
//

import SwiftUI

struct CancelSaveAlarmView: View {
    //MARK: - Variables
    let currentAlarmIndex: Int?
    @Binding var alarmModel: AlarmModel
    @EnvironmentObject var lnManager: LocalNotificationManager
    @Environment(\.dismiss) var dismiss
    
    //MARK: - Views
    var body: some View {
        HStack{
            Button(
                action: {
                    dismiss()
                },
                label: {
                    Text("Cancel")
                })
            .padding()
            Spacer()
            Button(
                action: {
                    if let currentAlarmIndex = currentAlarmIndex {
                        lnManager.alarmViewModels[currentAlarmIndex] = alarmModel
                    }
                    else {
                        lnManager.safeAppend(localNotification: alarmModel)
                    }
                    Task {
                        if alarmModel.alarmEnabled {
                            await lnManager.schedule(localNotification: alarmModel)
                        }
                        else {
                            lnManager.removeRequest(id: alarmModel.id)
                        }
                    }
                    
                    dismiss()
                },
                label: {
                    Text("Save")
                })
            .padding()
        }
        
    }
}

#Preview {
    CancelSaveAlarmView(currentAlarmIndex: nil, alarmModel: .constant(AlarmModel.defaultAlarm()))
        .environmentObject(LocalNotificationManager())
}
