//
//  AlarmToggleView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 9.02.24.
//

import SwiftUI

struct AlarmToggleView: View {
    //MARK: - Variables
    @Binding var alarmEnabled: Bool
    
    //MARK: - Views
    var body: some View {
        HStack {
            GrayedTextView(text: "Alarm")
            Spacer()
            SwitchButtonView(isOn: $alarmEnabled)
        }
        .padding()
    }
}

#Preview {
    AlarmToggleView(alarmEnabled: .constant(true))
}
