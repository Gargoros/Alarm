//
//  AlarmApp.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 7.02.24.
//

import SwiftUI

@main
struct AlarmApp: App {
    
    @StateObject var lnManager: LocalNotificationManager = LocalNotificationManager()
    
    var body: some Scene {
        
        WindowGroup {
            SplashScreenView()
                .environmentObject(lnManager)
            //MainAlarmView()
        }
    }
}
