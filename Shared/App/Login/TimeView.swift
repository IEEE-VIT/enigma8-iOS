//
//  TimeView.swift
//  Enigma (iOS)
//
//  Created by Alok N on 05/10/21.
//

import SwiftUI

struct TimeView: View {
    @StateObject var timeVM: TimerViewModel = TimerViewModel()
    let timer = Timer.publish(every: 1, on: .main, in: .common)
    
    init() {
        timeVM.getLeftTime()
    }
    
    var body: some View {
        HStack {
            TimerBlockView(value: timeVM.timeLeft.days ?? 10)
            TimerBlockView(value: timeVM.timeLeft.hours ?? 10)
            TimerBlockView(value: timeVM.timeLeft.minutes ?? 10)
            TimerBlockView(value: timeVM.timeLeft.seconds ?? 10)
        }
        .onReceive(timer) { _ in
            timeVM.performCountdown()
        }
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
