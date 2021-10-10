//
//  TimeView.swift
//  Enigma (iOS)
//
//  Created by Alok N on 05/10/21.
//

import SwiftUI

struct TimeView: View {
    @StateObject var timeVM: TimerViewModel = TimerViewModel()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            HStack {
                TimerBlockView(value: timeVM.enigmaDateComponents.day ?? 0)
                TimerBlockView(value: timeVM.enigmaDateComponents.hour ?? 0)
                TimerBlockView(value: timeVM.enigmaDateComponents.minute ?? 0)
                TimerBlockView(value: timeVM.enigmaDateComponents.second ?? 0)
            }
            if(timeVM.started) {
                CustomButton(buttonText: "Continue",action: continuePressed)
            }
        }
        .onReceive(timer, perform: performCountdown)
    }
    
    func performCountdown(_ output: Timer.TimerPublisher.Output) {
        guard timeVM.performCountdown() else {
            self.timer.upstream.connect().cancel()
            timeVM.getLeftTime()
            return
        }
    }
    
    func continuePressed() {
        timeVM.getLeftTime()
        if(timeVM.started) {
            //TODO: NAVIGATION TO PLAY VIEW
        } else {
            // TODO: SHOW ALERT "ENIGMA STARTS AT XX:XX:XX IST"
        }
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
