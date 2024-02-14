//
//  TimeAndDateExtension.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 7.02.24.
//

import Foundation


//MARK: Extension of DATE that enables us to subtract dates
extension Date {
    
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}
