//
//  TimeView.swift
//  Enigma (iOS)
//
//  Created by Alok N on 05/10/21.
//

import SwiftUI

struct TimeView: View {
    @EnvironmentObject var timeVM: TimerViewModel
    @State var showDemoQuestion: Bool = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { gr in
            VStack(spacing:50) {
                TimerBanner()
                
                CustomLabel(text: "ENIGMA", font: .Cinzel(size: 49, weight: .black))
                    
                Text("The Ultimate Cryptic Hunt Begins in ")
                    .font(.Mulish(size: 23, weight: .regular))
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .foregroundColor(.eGold)
                
                TimerBlockView(components: timeVM.enigmaDateComponents, width: gr.size.width)
                
                Spacer()
                
                CustomGradientButton(buttonText: timeVM.started ? "Play Now" : "Demo Question",action: continuePressed)
                TimerBanner(reverse: true)
            }
            .frame(maxWidth: .infinity)
            .padding(16)
            .background(Color.black)
            .onReceive(timer, perform: performCountdown)
            .fullScreenCover(isPresented: $showDemoQuestion) {
               Text("DEMO GAME HERE") // TODO
            }
        }
        .frame(maxWidth: .infinity)
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
            withAnimation {
                timeVM.navigateToRooms = true
            }
        } else {
            self.showDemoQuestion = true
        }
    }
}

struct TimerBlockView:View {
    var components: DateComponents
    var width: CGFloat
    var body: some View {
        HStack {
            TimerBlock(value: components.day ?? 0, width: width * 0.3, title: "Days")
            Spacer()
            TimerBlock(value: components.hour ?? 0, width: width * 0.3, title: "Hours")
            Spacer()
            TimerBlock(value: components.minute ?? 0, width: width * 0.3, title: "Minutes")
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
            .environmentObject(TimerViewModel())
    }
}
