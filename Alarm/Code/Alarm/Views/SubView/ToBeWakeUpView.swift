//
//  ToBeWakeUpView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 9.02.24.
//

import SwiftUI

struct ToBeWakeUpView: View {
    //MARK: - Variables
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    
    //MARK: - Views
    var body: some View {
        NavigationStack {
            VStack(){
                CancelSaveAlarmView(currentAlarmIndex: currentAlarmIndex, alarmModel: $alarmModel)
                AlarmToggleView(alarmEnabled: $alarmModel.alarmEnabled)
                Divider()
                HStack{
                    Grid{
                        GridRow{
                            TimeOfDayIconView(date: alarmModel.start)
                                .font(.largeTitle)
                            VStack(alignment: .leading){
                                GrayedTextView(text: "start")
                                TimePickerView(time: $alarmModel.start, scale: 1.3)
                            }
                        }
                        GridRow{
                            HStack{
                                Divider()
                                    .frame(height: 30)
                                    .padding(2)
                            }
                        }
                        GridRow{
                            Image(systemName: alarmModel.activity)
                                .foregroundStyle(alarmModel.activityColor)
                                .font(.headline)
                            
                            SelectActivityView(
                                currentColorIndex: $alarmModel.colorIndex,
                                currentActivity: $alarmModel.activity)
                        }
                        .padding(.vertical)
                        GridRow{
                            HStack{
                                Divider()
                                    .frame(height: 30)
                                    .padding(2)
                            }
                        }
                        GridRow{
                            TimeOfDayIconView(date: alarmModel.end)
                                .font(.largeTitle)
                            VStack(alignment: .leading){
                                TimePickerView(time: $alarmModel.end, scale: 1.3)
                                GrayedTextView(text: "end")
                                
                            }
                        }
                        GridRow{
                            Spacer()
                            SoundMenuViewFromButton(alarmModel: $alarmModel)
                        }
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
            }
            .padding()
            .background(
                Color.appColorCardBackgroundColor
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding()
        )
        }
    }
}

#Preview {
    ZStack {
        Color.gray
            .opacity(0.3)
            .ignoresSafeArea()
        
        ToBeWakeUpView(currentAlarmIndex: nil, alarmModel: AlarmModel.defaultAlarm())
    }
}
