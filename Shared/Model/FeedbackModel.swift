//
//  FeedbackModel.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/4/21.
//

import Foundation

struct FeedbackModel {
    struct Request: Codable {
        var text: String?
    }
    struct Response: Codable {
        var message: String?
    }
}
