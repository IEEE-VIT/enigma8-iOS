//
//  RoomsView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/14/21.
//

import SwiftUI

struct RoomsView: View {
    var timerVM: TimerViewModel = TimerViewModel()
    var enigmaEnd: Date {
        Date(timeInterval: 172800,since: timerVM.enigmaDate ?? Date())
    }
    var timeLeft: DateComponents {
        Calendar.current.dateComponents([.hour,.minute,.second], from: Date(), to: enigmaEnd)
    }
    var numberOfStars: Int
    let rooms = [0,2,4,6]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        VStack {
            // MARK: TITLE
            HStack {
                Text("Rooms")
                    .font(.title)
                Spacer()
                Label(": \(numberOfStars)", systemImage: "star.fill")
                    .font(.title)
            }
            // MARK: TIMER
            HStack {
                TimerBlockView(value: (timeLeft.hour ?? 0) / 10)
                TimerBlockView(value: (timeLeft.hour ?? 0 ) % 10)
                Text(":")
                TimerBlockView(value: (timeLeft.minute ?? 0) / 10)
                TimerBlockView(value: (timeLeft.minute ?? 0 ) % 10)
                Text(":")
                TimerBlockView(value: (timeLeft.second ?? 0) / 10)
                TimerBlockView(value: (timeLeft.second ?? 0 ) % 10)
            }
            Spacer()
            // MARK: GRID
            ForEach(rooms, id: \.self) { roomNum in
                HStack() {
                    ForEach(roomNum+1 ..< roomNum+3) { rNumber in
                        Spacer()
                        VStack {
                            Spacer()
                            Image(systemName: "star")
                            Text("Room \(rNumber)")
                            Spacer()
                        }
                        Spacer()
                    }
                }
            }
//            LazyVGrid(columns: columns, spacing: 20) {
//                ForEach(rooms, id: \.self) { roomnum in
//                    VStack {
//                        Text("Room \(roomnum)")
//                        Image(systemName: "star")
//                            .resizable()
//                    }
//                }
//            }
        }
        .padding()
    }
}

struct RoomsView_Previews: PreviewProvider {
    static var previews: some View {
        RoomsView(numberOfStars: 2)
    }
}
