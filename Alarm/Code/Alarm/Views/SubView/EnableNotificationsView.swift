//
//  EnableNotificationsView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 8.02.24.
//

import SwiftUI

struct EnableNotificationsView: View {
    //MARK: - Variables
    @EnvironmentObject var lnManager: LocalNotificationManager
    
    //MARK: - Views
    var body: some View {
        ZStack {
            FourCoolCircles(color1: Color.appColorDarkYellow, color2: Color.appColorLightGray)
            
            VStack {
                Spacer()
                CoolTextView(text: LocalizedStringKey("Enable notifications, please"), size: 48)
                    .multilineTextAlignment(.center)
                Spacer()
                
                Button(
                    action: {
                        lnManager.openSettings()
                    },
                    label: {
                    ButtonView(text: "enable")
                })
                .padding()
            }
        }
    }
}

#Preview {
    EnableNotificationsView()
        .environmentObject(LocalNotificationManager())
}
