//
//  FeedbackModel.swift
//  Enigma (iOS)
//
//  Created by Aaryan Kothari on 21/11/21.
//

import Foundation

class FeedbackModel: Codable {
    var isVITStudent: Bool
    var regNo: String?
    var vitEmail: String?
    var gameRating: Int
    var userExperience: String
    var featureIdeas: String
    
    internal init(isVITStudent: Bool, regNo: String? = nil, vitEmail: String? = nil, gameRating: Int, userExperience: String, featureIdeas: String) {
        self.isVITStudent = isVITStudent
        self.regNo = regNo
        self.vitEmail = vitEmail
        self.gameRating = gameRating
        self.userExperience = userExperience
        self.featureIdeas = featureIdeas
    }
}



struct FeedbackFilled: Codable {
    var data: FeedbackData?
}

struct FeedbackData: Codable {
    var feedbackFilled: Bool?
}
