//
//  TimerViewModel.swift
//  Enigma (iOS)
//
//  Created by Alok N on 30/09/21.
//

import Foundation
import SwiftUI

class TimerViewModel: ObservableObject {
    
    @Published var timeLeft: TimeLeft = TimeLeft()
    
    init() {
        getLeftTime()
    }
    
    func getLeftTime() {
        APIClient.request(fromRouter: Router.timer) { (response: ApiResponse<TimerResponse>?, error) in
            if let error = error {
                Logger.error(error.debugDescription)
                return
            }
            self.timeLeft = TimeLeft(response: response?.data! ?? TimerResponse())
        }
    }
    
    func performCountdown() {
        if(timeLeft.fetched) {
            timeLeft.enigmaDate = Calendar.current.date(byAdding: .second, value: -1, to: timeLeft.enigmaDate) ?? Date()
            timeLeft.enigmaDateComponents = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: timeLeft.recordedDate, to: timeLeft.enigmaDate)
        }
    }
    
}

struct TimeLeft {
    var recordedDate: Date = Date()
    var enigmaDate: Date = Date()
    var enigmaDateComponents: DateComponents = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: Date(), to: Date())
    var fetched: Bool = false
    
    init(response: TimerResponse? = nil) {
        if(response != nil && !(response!.enigmaStarted ?? true)) {
            let secondsLeft = response!.date ?? 100000
            self.enigmaDate = Calendar.current.date(byAdding: .second, value: secondsLeft, to: Date()) ?? Date()
            self.recordedDate = Date()
            self.enigmaDateComponents = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: self.recordedDate, to: self.enigmaDate)
            self.fetched = true
        }
    }
}
