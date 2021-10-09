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
        Logger.info("Requesting Time")
        APIClient.request(fromRouter: Router.timer) { (response: TimerResponse?, error) in
            if let error = error {
                Logger.error(error.debugDescription)
                return
            }
            self.timeLeft = TimeLeft(response: response)
        }
    }
    
    func performCountdown(){
        if(timeLeft.fetched && !timeLeft.hasStarted) {
            timeLeft.enigmaDate = Calendar.current.date(byAdding: .second, value: -1, to: timeLeft.enigmaDate) ?? Date()
            timeLeft.enigmaDateComponents = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: timeLeft.recordedDate, to: timeLeft.enigmaDate)
            if(Calendar.current.dateComponents([.second], from: timeLeft.recordedDate, to: timeLeft.enigmaDate).second == 0) {
                timeLeft.hasStarted = true
            }
        }
    }
    
}

struct TimeLeft {
    var recordedDate: Date = Date()
    var enigmaDate: Date = Date()
    var enigmaDateComponents: DateComponents = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: Date(), to: Date())
    var fetched: Bool = false
    var hasStarted: Bool = false
    
    init(response: TimerResponse? = nil) {
        if(response != nil) {
            if(!(response!.enigmaStarted ?? false)) {
                let secondsLeft = response!.date ?? 0
                self.enigmaDate = Calendar.current.date(byAdding: .second, value: secondsLeft, to: Date()) ?? Date()
                self.recordedDate = Date()
                self.enigmaDateComponents = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: self.recordedDate, to: self.enigmaDate)
                self.fetched = true
            }
            self.hasStarted = response!.enigmaStarted ?? false
            self.fetched = true
        }
    }
}
