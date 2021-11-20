//
//  LeaderboardItem.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/14/21.
//

import Foundation

struct Leaderboard {
    struct Request:Codable {
        var page: Int?
        var query: String?
        var perPage: Int?
    }
    struct Response: Codable {
        var page: Int?
        var userRank: LeaderboardItem?
        var leaderboard: [LeaderboardItem]?
        var totalPage: Int?
    }
}

struct LeaderboardItem: Codable, Hashable {
    var username: String?
    var doubleScore: Double?
    var questionsSolved: Int?
    var rank: Int?
    
    private enum CodingKeys: String, CodingKey {
        case username = "username"
        case doubleScore = "score"
        case questionsSolved = "questionsSolved"
        case rank = "rank"
    }
    
    var score: Int {
        return Int(doubleScore ?? 0.0)
    }
}

extension LeaderboardItem {
    static var data: [LeaderboardItem] {
        [
            LeaderboardItem(username: "ryan", doubleScore: 42, questionsSolved: 5, rank: 2),
            LeaderboardItem(username: "ross", doubleScore: 30, questionsSolved: 2, rank: 3),
            LeaderboardItem(username: "george", doubleScore: 55, questionsSolved: 8, rank: 1),
            LeaderboardItem(username: "jon", doubleScore: 42, questionsSolved: 5, rank: 9),
            LeaderboardItem(username: "jacob", doubleScore: 30, questionsSolved: 2, rank: 8),
            LeaderboardItem(username: "walker", doubleScore: 55, questionsSolved: 8, rank: 5),
            LeaderboardItem(username: "nick", doubleScore: 42, questionsSolved: 5, rank: 7),
            LeaderboardItem(username: "murray", doubleScore: 30, questionsSolved: 2, rank: 6),
            LeaderboardItem(username: "andy", doubleScore: 55, questionsSolved: 8, rank: 11),
            LeaderboardItem(username: "pete", doubleScore: 42, questionsSolved: 5, rank: 12),
            LeaderboardItem(username: "patrick", doubleScore: 30, questionsSolved: 2, rank: 30),
            LeaderboardItem(username: "joe", doubleScore: 55, questionsSolved: 8, rank: 14)
        ]
    }
}
