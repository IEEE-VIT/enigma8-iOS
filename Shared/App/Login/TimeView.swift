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
                TimerBlockView(value: timeVM.timeLeft.enigmaDateComponents.day ?? 0)
                TimerBlockView(value: timeVM.timeLeft.enigmaDateComponents.hour ?? 0)
                TimerBlockView(value: timeVM.timeLeft.enigmaDateComponents.minute ?? 0)
                TimerBlockView(value: timeVM.timeLeft.enigmaDateComponents.second ?? 0)
            }
            if(timeVM.timeLeft.fetched && timeVM.timeLeft.hasStarted) {
                CustomButton(buttonText: "Continue") {
                    timeVM.getLeftTime(); //Confirm Enigma Started
                    if(timeVM.timeLeft.hasStarted) {
                        Logger.info("CONFIRMED: Enigma Started")
                        //TODO: NAVIGATION TO PLAY VIEW
                    }
                }
            }
        }
        .onReceive(timer) { _ in
            if(!timeVM.timeLeft.hasStarted && timeVM.timeLeft.fetched) {
                timeVM.performCountdown()
            }
        }
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
