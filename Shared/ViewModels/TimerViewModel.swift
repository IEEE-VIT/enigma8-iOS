//
//  TimerViewModel.swift
//  Enigma (iOS)
//
//  Created by Alok N on 30/09/21.
//

import Foundation
import SwiftUI

class TimerViewModel: ObservableObject {
    
    @AppStorage(AppStorageConstants.enigmaStarted) var enigmaStarted: Bool = false
    @Published var enigmaDate: Date? = nil
    @Published var enigmaDateComponents: DateComponents = DateComponents()
    @Published var started: Bool = false
    
    init() {
        getLeftTime()
    }
    
    func getLeftTime() {
        APIClient.request(fromRouter: .timer) { (response: TimerResponse?, error) in
            guard let response = response else { return }
            self.started = response.started
            self.enigmaStarted = response.started
            self.enigmaDate = response.enigmaDate
        }
    }
    
    func performCountdown() -> Bool {
        guard let enigmaDate = enigmaDate else { return true }
        self.enigmaDateComponents = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: Date(), to: enigmaDate)
        return enigmaDate >= Date()
    }
    
}
