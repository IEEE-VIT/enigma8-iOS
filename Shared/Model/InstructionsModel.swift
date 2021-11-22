//
//  InstructionsModel.swift
//  Enigma (iOS)
//
//  Created by Aaryan Kothari on 22/11/21.
//

import Foundation

class InstructionsModel: Codable {
    var gameMechanics: [String]?
    var scoringSystem: [String]?
    var roomStates: [String]?
    var powerUps: [String]?
    var miscellaneous: [String]?
}
