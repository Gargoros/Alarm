//
//  AlarmRowViewButton.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 13.02.24.
//

import SwiftUI

struct AlarmRowViewButton: View {
    //MARK: - Variables
    @EnvironmentObject var lnManager: LocalNotificationManager
    let model: AlarmModel
    let item: Int
    @Binding var currentIndex: Int?
    @Binding var isActive: Bool
    
    //MARK: - Views
    var body: some View {
        HStack {
            Button(
                action: {
                    currentIndex = item
                    isActive.toggle()
                },
                label: {
                    HStack (alignment: .center, spacing: 20){
                        Image(systemName: model.activity)
                            .foregroundStyle(model.activityColor)
                            .font(.title)
                        Text("\(getTimeFromDate(date: model.start)) - \(getTimeFromDate(date: model.end))")
                            .font(.title3)
                            .fontWeight(model.alarmEnabled ? .regular : .thin)
                            .scaleEffect(model.alarmEnabled ? 1.05: 1.0)
                            .opacity(model.alarmEnabled ? 1.0 : 0.7)
                        
                        
                    }
                })
            Spacer()
            
            if item < lnManager.alarmViewModels.count {
                SwitchButtonView(isOn: $lnManager.alarmViewModels[item].alarmEnabled)
            }
        }
        .onChange(of: model.alarmEnabled) {
            if model.alarmEnabled {
                Task{
                    await lnManager.schedule(localNotification: model)
                }
            }else{
                lnManager.removeRequest(id: model.id)
            }
        }
    }
}

#Preview {
    AlarmRowViewButton(
        model: AlarmModel.defaultAlarm(),
        item: 0,
        currentIndex: .constant(0),
        isActive: .constant(true))
    .environmentObject(LocalNotificationManager())
}
