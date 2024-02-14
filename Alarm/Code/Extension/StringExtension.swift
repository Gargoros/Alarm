//
//  StringExtension.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 13.02.24.
//

import Foundation

extension String {
    
    var formatSoundName: String {
        var result = String(describing: self)
            .replacingOccurrences(of: "_", with: " ")
            .capitalized
        
        let periodIndex: Index? = result.firstIndex(of: ".")
        if let periodIndex = periodIndex {
            result.removeSubrange(periodIndex...)
        }
        
        return result
    }
}
