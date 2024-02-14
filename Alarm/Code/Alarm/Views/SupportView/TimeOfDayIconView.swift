//
//  TimeOfDayIconView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 7.02.24.
//

import SwiftUI

struct TimeOfDayIconView: View {
    //MARK: - Variables
    let date: Date
    var precent: CGFloat {
        return dateToPrecent(date: date)
    }
    var hour: Int {
        return Int(24 * precent)
    }
    var image: (name: String, color: Color) {
        switch(hour){
        case 6..<8:
            return ("sun.and.horizon.fill", .orange)
        case 8..<17:
            return ("sun.max.fill", .yellow)
        case 17..<20:
            return ("sun.and.horizon.fill", .pink)
        case 20..<23:
            return ("moon.fill", .black)
        default:
            return ("moon.stars.fill", .black)
        }        
    }
    
    //MARK: - Views
    var body: some View {
        
        Image(systemName: image.name)
            .foregroundStyle(image.color)
        
    }
}

#Preview {
    
    
    List(0..<24){item in
        let theDate = addHourToDate(date: Date(), numHours: item, numMinutes: 0)
        HStack {
            Text(getTimeFromDate(date: theDate))
            Spacer()
            TimeOfDayIconView(date: theDate)
        }
    }
    .padding()
}
