//
//  LeaderboardItem.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/14/21.
//

import Foundation

typealias Leaderboard = [LeaderboardItem]

struct LeaderboardItem: Codable, Identifiable {
    var username: String?
    var score: Int?
    var solved: Int?
    var id = UUID()
}

extension LeaderboardItem {
    static var data: [LeaderboardItem] {
        [
            LeaderboardItem(username: "ryan", score: 42, solved: 5),
            LeaderboardItem(username: "ross", score: 30, solved: 2),
            LeaderboardItem(username: "george", score: 55, solved: 8)
        ]
    }
}
