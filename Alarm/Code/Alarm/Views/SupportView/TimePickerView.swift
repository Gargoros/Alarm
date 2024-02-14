//
//  TimePickerView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 9.02.24.
//

import SwiftUI

struct TimePickerView: View {
    //MARK: - Variables
    @Binding var time: Date
    let scale: CGFloat
    
    //MARK: - Views
    var body: some View {
        DatePicker("", selection: $time, displayedComponents: .hourAndMinute)
            .scaleEffect(scale)
            .labelsHidden()
    }
}

#Preview {
    TimePickerView(time: .constant(Date()), scale: 1.3)
}
