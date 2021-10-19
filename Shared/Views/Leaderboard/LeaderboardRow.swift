//
//  LeaderboardRow.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/14/21.
//

import SwiftUI

struct LeaderboardRow: View {
    // TODO: align columns
    var isUser: Bool = false
    var user: LeaderboardItem
    var body: some View {
        HStack {
            Text("\(user.rank ?? 0)")
                .padding(.trailing)
            Text(user.username ?? "someUsername")
            Spacer()
            Text("\(user.score ?? 0)")
            Spacer()
            Text("\(user.solved ?? 0)")
                .padding(.trailing)
        }
        .scaleEffect(isUser ? 1.1 : 1.0)
        .padding(.all, 20)
        .background(isUser ? Color.red : Color.gray)
        .shadow(radius: isUser ? 4 : 0)
    }
}

struct LeaderboardRow_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardRow(user: LeaderboardItem.data[0])
            .previewLayout(.sizeThatFits)
    }
}
