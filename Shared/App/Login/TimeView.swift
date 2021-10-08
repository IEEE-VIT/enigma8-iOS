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
        HStack {
            TimerBlockView(value: timeVM.timeLeft.enigmaDateComponents.day ?? 0)
            TimerBlockView(value: timeVM.timeLeft.enigmaDateComponents.hour ?? 0)
            TimerBlockView(value: timeVM.timeLeft.enigmaDateComponents.minute ?? 0)
            TimerBlockView(value: timeVM.timeLeft.enigmaDateComponents.second ?? 0)
            if((timeVM.timeLeft.fetched && timeVM.timeLeft.enigmaDateComponents.value(for: .second)==0) || timeVM.timeLeft.hasStarted) {
                Button("Continue") {
                    timeVM.getLeftTime()
                    if(timeVM.timeLeft.hasStarted) {
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
