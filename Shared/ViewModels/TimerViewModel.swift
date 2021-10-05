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
                print(error.debugDescription)
                return
            }
            print(response?.data! ?? "Unable to parse Timer Response from Data")
            self.timeLeft = TimeLeft(response: response?.data! ?? TimerResponse())
        }
    }
    
    func performCountdown() {
        if(timeLeft.seconds != 0){
            timeLeft.seconds! -= 1
        } else if(timeLeft.minutes != 0) {
            timeLeft.minutes! -= 1
            timeLeft.seconds = 59
        } else if(timeLeft.hours != 0) {
            timeLeft.hours! -= 1
            timeLeft.minutes = 59
            timeLeft.seconds = 59
        } else if(timeLeft.days != 0) {
            timeLeft.days! -= 1
            timeLeft.hours = 23
            timeLeft.minutes = 59
            timeLeft.seconds = 59
        }
    }
    
}

struct TimeLeft {
    var days: Int?
    var hours: Int?
    var minutes: Int?
    var seconds: Int?
    
    init(response: TimerResponse) {
        if(!(response.enigmaStarted ?? true)) {
            var date = response.date ?? 100000
            self.days = date/86400
            date %= 86400
            self.hours = date/3600
            date %= 3600
            self.minutes = date/60
            self.seconds = date%60
            //print(self.days, self.hours, self.minutes, self.seconds)
        }
    }
    
    init() {
        self.days = 0
        self.hours = 0
        self.minutes = 0
        self.seconds = 0
    }
    
}
