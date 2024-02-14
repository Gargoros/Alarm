//
//  SoundMenuView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 13.02.24.
//

import SwiftUI

struct SoundMenuView: View {
    //MARK: - Variables
    @Binding var alarmSound: Sounds
    
    //MARK: - Views
    var body: some View {
        Form{
            Section(
                content: {
                    ForEach(ringToneSoundsList, id: \.self) {ringtone in
                        Button(
                            action: {
                                alarmSound = ringtone
                                playSound(sound: ringtone.rawValue)
                            },
                            label: {
                                HStack {
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(Color.appColorPurple)
                                        .fontWeight(.semibold)
                                        .opacity(alarmSound == ringtone ? 1.0 : 0.0)
                                    
                                    Text(ringtone.rawValue.formatSoundName)
                                        .foregroundStyle(Color.appColorBlack)
                                        .fontWeight(.semibold)
                                }
                        })
                    }
                },
                header: {
                    Text("Ringtone Sounds")
                })
            
            Section(
                content: {
                    ForEach(natureSoundsList, id: \.self) {natureSound in
                        Button(
                            action: {
                                alarmSound = natureSound
                                playSound(sound: natureSound.rawValue)
                            },
                            label: {
                                
                                HStack {
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(Color.appColorPurple)
                                        .fontWeight(.semibold)
                                        .opacity(alarmSound == natureSound ? 1.0 : 0.0)
                                    
                                    Text(natureSound.rawValue.formatSoundName)
                                        .foregroundStyle(Color.appColorBlack)
                                        .fontWeight(.semibold)
                                }
                        })
                    }
                },
                header: {
                    Text("Sounds of Nature")
                })
        }
        .onDisappear{
            stopPlaying()
        }
    }
}

#Preview {
    SoundMenuView(alarmSound: .constant(AlarmModel.defaultAlarm().sound))
}
