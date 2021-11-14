//
//  AnswerModel.swift
//  Enigma (iOS)
//
//  Created by Alok N on 14/11/21.
//

import Foundation

struct Answer: Codable {
    struct Request: Codable {
        var roomId: String
        var userAnswer: String
    }
    struct Response: Codable {
        var correctAnswer: Bool?
        var closeAnswer: Bool?
        var scoreEarned: Int?
        var nextRoomUnlocked: Bool?
        var nextRoomId: String?
        var questionId: String?
    }
}
