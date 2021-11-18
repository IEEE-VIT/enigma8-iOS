//
//  LeaderboardHeader.swift
//  Enigma (iOS)
//
//  Created by Alok N on 17/11/21.
//

import SwiftUI

struct LeaderboardHeader: View {
    var geo: GeometryProxy
    var body: some View {
//        GeometryReader { geo in
            ZStack(alignment: .top) {
                HStack(alignment: .top, spacing: 0) {
                    Text("Rank")
                        .frame(width: geo.size.width*0.15)
                    .padding(5)
                    .gradientForeground(colors: [.goldGradientStart, .goldGradientEnd])
                    Rectangle().fill(Color.eBlue).frame(width: 1, height: geo.size.height, alignment: .center)
                    Text("Username")
                        .frame(width: geo.size.width*0.4, alignment: .center)
                    .padding(5)
                    .gradientForeground(colors: [.goldGradientStart, .goldGradientEnd])
                    Rectangle().fill(Color.eBlue).frame(width: 1, height: geo.size.height, alignment: .center)
                    Text("Score")
                        .frame(width: geo.size.width*0.2, alignment: .center)
                    .padding(5)
                    .gradientForeground(colors: [.goldGradientStart, .goldGradientEnd])
                    Rectangle().fill(Color.eBlue).frame(width: 1, height: geo.size.height, alignment: .center)
                    Text("Solved")
                        .frame(width: geo.size.width*0.15, alignment: .center)
                    
                    .padding(5)
                    .gradientForeground(colors: [.goldGradientStart, .goldGradientEnd])
                }.font(.Mulish(size: 16, weight: .semibold))
                    .background(Color.black)
                
                Rectangle().fill(Color.eBlue).frame(width: geo.size.width, height: 1).padding(.top, 30)
            }
//        }
    }
}
//
//struct LeaderboardHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        LeaderboardHeader()
//    }
//}
