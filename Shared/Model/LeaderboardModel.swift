//
//  LeaderboardItem.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/14/21.
//

import Foundation

struct Leaderboard {
    struct SearchRequest: Codable {
        var page: Int
        var query: String
        var perPage: Int
    }
    struct Request:Codable {
        var page: Int
        var perPage: Int
    }
    struct Response: Codable {
        var page: Int?
        var userRank: LeaderboardItem
        var leaderboard: [LeaderboardItem]
    }
}

struct LeaderboardItem: Codable, Hashable {
    var username: String?
    var score: Int?
    var questionsSolved: Int?
    var rank: Int?
    
    init(username: String?, score: Int?, questionsSolved: Int?, rank: Int?) {
        self.username = username
        self.score = score
        self.questionsSolved = questionsSolved
        self.rank = rank
    }
}

extension LeaderboardItem {
    static var data: [LeaderboardItem] {
        [
            LeaderboardItem(username: "ryan", score: 42, questionsSolved: 5, rank: 2),
            LeaderboardItem(username: "ross", score: 30, questionsSolved: 2, rank: 3),
            LeaderboardItem(username: "george", score: 55, questionsSolved: 8, rank: 1),
            LeaderboardItem(username: "jon", score: 42, questionsSolved: 5, rank: 9),
            LeaderboardItem(username: "jacob", score: 30, questionsSolved: 2, rank: 8),
            LeaderboardItem(username: "walker", score: 55, questionsSolved: 8, rank: 5),
            LeaderboardItem(username: "nick", score: 42, questionsSolved: 5, rank: 7),
            LeaderboardItem(username: "murray", score: 30, questionsSolved: 2, rank: 6),
            LeaderboardItem(username: "andy", score: 55, questionsSolved: 8, rank: 11),
            LeaderboardItem(username: "pete", score: 42, questionsSolved: 5, rank: 12),
            LeaderboardItem(username: "patrick", score: 30, questionsSolved: 2, rank: 30),
            LeaderboardItem(username: "joe", score: 55, questionsSolved: 8, rank: 14)
        ]
    }
}
