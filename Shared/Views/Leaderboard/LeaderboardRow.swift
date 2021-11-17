//
//  LeaderboardRow.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/14/21.
//

import SwiftUI

struct LeaderboardRow: View {
    // TODO: align columns
    var noUseGradient = LinearGradient(colors: [Color.clear, Color.clear], startPoint: .top, endPoint: .bottom)
    var isUser: Bool = false
    var geo: GeometryProxy
    var user: LeaderboardItem
    var body: some View {
            HStack {
                Text("\(user.rank ?? 0)")
                    .frame(width: geo.size.width*0.15)
                Text(user.username ?? "someUsername")
                    .frame(width: geo.size.width*0.45, alignment: .center)
                Text(String(format: "%.2f", user.score ?? 0))
                    .frame(width: geo.size.width*0.2, alignment: .center)
                Text("\(user.questionsSolved ?? 0)")
                    .frame(width: geo.size.width*0.15, alignment: .center)
            }
            .gradientForeground(colors: isUser ? [.goldGradientStart, .goldGradientEnd] : [Color.clear, Color.clear])
            .font(.Mulish(size: 16, weight: .semibold))
            .foregroundColor(.eGold)
            .scaleEffect(isUser ? 1.05 : 1.0)
            .padding(.vertical)
            .shadow(radius: isUser ? 4 : 0)
            .border(isUser ? LinearGradient.gold : noUseGradient, width: 2)
            .background(isUser ? Color.black : Color.clear)
    }
}

//struct LeaderboardRow_Previews: PreviewProvider {
//    static var previews: some View {
//        LeaderboardRow(user: LeaderboardItem.data[0])
//            .previewLayout(.sizeThatFits)
//    }
//}
