//
//  SoundMenuViewFromButton.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 13.02.24.
//

import SwiftUI

struct SoundMenuViewFromButton: View {
    //MARK: - Variables
    @Binding var alarmModel: AlarmModel
    
    
    //MARK: - Views
    var body: some View {
        NavigationLink(
            destination: {
                SoundMenuView(alarmSound: $alarmModel.sound)
            },
            label: {
                HStack{
                    Text("Sound")
                        .fontWeight(.semibold)
                    Text(alarmModel.sound.rawValue.formatSoundName)
                        .font(.caption)
                        .fontWeight(.thin)
                }
                .padding(7)
                .overlay(
                    Capsule()
                        .stroke(lineWidth: 1.0)
                )
            })
    }
}

#Preview {
    SoundMenuViewFromButton(alarmModel: .constant(AlarmModel.defaultAlarm()))
}
