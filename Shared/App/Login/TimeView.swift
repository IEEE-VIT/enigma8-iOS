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
            TimerBanner()
            TimerBlockView(components: timeVM.enigmaDateComponents)
            if(timeVM.started) {
                CustomButton(buttonText: "Continue",action: continuePressed)
            }
            TimerBanner(reverse: true)
        }
        frame(maxWidth: .infinity)
            .padding(16)
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

struct TimerBlockView:View {
    var components: DateComponents
    var body: some View {
        GeometryReader { gr in
            HStack {
                Spacer()
                TimerBlock(value: components.day ?? 0, width: gr.size.width * 0.3, title: "Days")
                Spacer()
                TimerBlock(value: components.hour ?? 0, width: gr.size.width * 0.3, title: "Hours")
                Spacer()
                TimerBlock(value: components.minute ?? 0, width: gr.size.width * 0.3, title: "Minutes")
                Spacer()
            }
        }
    }
}

struct TimerBanner: View {
    var reverse : Bool = false
    var body: some View{
        Image(ImageConstants.timer)
            .resizable()
            .scaledToFit()
            .rotationEffect(.degrees(reverse ? 180 : 0))
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
