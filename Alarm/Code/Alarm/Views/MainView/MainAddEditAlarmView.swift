//
//  MainAddEditAlarmView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 12.02.24.
//

import SwiftUI

struct MainAddEditAlarmView: View {
    //MARK: - Variables
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    @State private var selectedTab = "One"
    
    //MARK: - Views
    var body: some View {
        TabView(selection: $selectedTab) {
            AddEditAlarmView(alarmModel: alarmModel, currentAlarmIndex: currentAlarmIndex)
                .tag("One")
            AddEditCircularAlarmView(currentAlarmIndex: currentAlarmIndex, alarmModel: alarmModel)
                .tag("Two")
        }
        .onAppear(){
            UIPageControl.appearance().currentPageIndicatorTintColor = .gray
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .ignoresSafeArea()
    }
}

#Preview {
    MainAddEditAlarmView(currentAlarmIndex: nil, alarmModel: AlarmModel.defaultAlarm())
}
