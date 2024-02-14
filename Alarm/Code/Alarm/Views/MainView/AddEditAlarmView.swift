//
//  AddEditAlarmView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 9.02.24.
//

import SwiftUI

struct AddEditAlarmView: View {
    //MARK: - Variables
    @State var alarmModel: AlarmModel
    let currentAlarmIndex: Int?
    @State private var showYouDidItView: Bool = true
    
    
    //MARK: - Views
    var body: some View {
        GeometryReader { geometry in
            ZStack(){
                Color.appColorBackgroundColor
                    .opacity(0.7)
                    .ignoresSafeArea()
                
                VStack(){
                    if showYouDidItView{
                        YouDidItView(width: geometry.size.width, height: geometry.size.height * 0.3)
                    }
                    ToBeWakeUpView(currentAlarmIndex: currentAlarmIndex, alarmModel: alarmModel)

                    
                }
            }
            .onAppear(){
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                    withAnimation(){
                        showYouDidItView = false
                    }
                }
        }
        }
    }
}

#Preview {
    AddEditAlarmView(
        alarmModel: AlarmModel.defaultAlarm(), currentAlarmIndex: nil
    )
}
