//
//  TimeModel.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 7.02.24.
//

import Foundation

struct TimeModel: Equatable, Comparable, Identifiable {
    
    let id: UUID = UUID()
    let hours: Int
    let minutes: Int
    
    static func < (lhs: TimeModel, rhs: TimeModel) -> Bool {
        
        return (lhs.hours < rhs.hours) || (lhs.hours == rhs.hours && lhs.minutes < rhs.minutes) ? true : false
    }
    
}
