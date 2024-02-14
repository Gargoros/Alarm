//
//  ContentView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 7.02.24.
//

import SwiftUI

struct MainAlarmView: View {
    //MARK: - Variables
    @EnvironmentObject var lnManager: LocalNotificationManager
    
    ///Every time the scene phase changes this will update
    ///Use onChanged
    @Environment(\.scenePhase) var scenePhase
    
    //MARK: - Views
    var body: some View {
        TabView{
            if lnManager.isAuthorized {
                ListOfAlarmsView()
                    .tabItem {
                        Label("Alarm", systemImage: "alarm.fill")
                    }
                AboutView()
                    .tabItem {
                        Label("About", systemImage: "info.circle.fill")
                    }
            } else {
                EnableNotificationsView()
            }
        }
        .ignoresSafeArea()
        .task {
            try? await lnManager.requestAuthorization()
        }
        .onChange(of: scenePhase) {
            if scenePhase == .active {
                Task{
                    await lnManager.getCurrentSettings()
                    
                    await lnManager.getPendingAlarms()
                }
            }
        }
        
    }
}

#Preview {
    MainAlarmView()
        .environmentObject(LocalNotificationManager())
}
