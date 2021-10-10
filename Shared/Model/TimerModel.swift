//
//  TimerModel.swift
//  Enigma (iOS)
//
//  Created by Alok N on 28/09/21.
//

import Foundation
import SwiftUI

struct TimerResponse : Codable {
    var date: Int?
    var enigmaStarted: Bool?
    
    var started: Bool {
        return enigmaStarted ?? false
    }
    
    var enigmaDate: Date {
        return Date(timeInterval: TimeInterval(date ?? 0), since: Date())
    }
}
