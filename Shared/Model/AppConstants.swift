//
//  AppConstants.swift
//  Enigma (iOS)
//
//  Created by Shriram Alagarasan on 29/09/21.
//

import Foundation

//MARK:- APP CONSTANTS ( STRINGS )

struct AppConstants {
    struct Google {
        static let clientId = "485828193401-2lev0d7s3ktqqu6ie7jthjadmftppfbv.apps.googleusercontent.com"
        static let serverClientId = "485828193401-acfdftfgnbsvpk6du4m4ogqjs62dbvc5.apps.googleusercontent.com"
    }
    
    struct OnBoarding: Identifiable {
        let id = UUID()
        let imageName: String
        let heading: String
        let subHeading: String
    }
    
    static let onBoardingScreens: [OnBoarding] = [OnBoarding(imageName: "Pharoah", heading: "Join Jones and Ali in their adventure\n through Egypt", subHeading: "Things take a turn for the worst when Jones and Ali wander through the depths of Egypt."),OnBoarding(imageName: "Rooms", heading: "Travel through 8 different rooms", subHeading: "Solve questions in each room to know more about the adventures of Jones and Ali"),OnBoarding(imageName: "Powerups_onboarding", heading: "Use Power-Ups and Hint when stuck", subHeading: "Everyone needs help once in a while, use Power Ups and hints to solve questions whenever stuck :)")]
    
    static let instructionsScreens: [String] = [
        "Game Mechanics",
        "Scoring System",
        "Powerups",
        "Room States",
        "Let's Play"
    ]
    
    static let instructionsGameMechanics: [String] = [
    "Enigma 8 is an online cryptic hunt where players solve exciting riddles and puzzles to win amazing prizes.",
    "There are eight rooms in total and each room has three questions.",
    "On solving a question, the player will receive a key.",
    "A particular amount of keys are required to unlock a room.",
    "Solve every question to be the first one to solve Enigma."
]
    static let instructionsScoringSystem: [String] = [
        "Upon solving a question, a player shall receive a particular amount of points relative to the competition  the earlier you solve a question, the higher your score will be.",
        "These points determine your position on the leaderboard.",
        "Upon using a hint, X points will be deducted from the score earned on solving that particular question."

    ]
    
    static let instructionsPowerups: [String] = [
        "Every player gets eight power ups at the start of the game.",
        "Before a player enters the room, they have to choose a powerup and the powerup chosen can only be used in that particular room.",
        "Only one powerup can be chosen per room and can only be used  only for one question in that room.",
        "No points will be deducted for using a powerup.",
        "Each powerup can be used only once, during the entire game."
    ]
    
    static let instructionsRoomStates: [String] = [
        "A room can either be locked, unlocked, or solved.",
        "A room is locked when the player does not have the minimum amount of keys to unlock it else if the player hasn’t yet chosen a powerup for that room.",
        "A room is unlocked when the player has sufficient keys and has chosen a powerup for that room.",
        "A room is solved only when a player solves all three questions in that room."
    ]
    
    static let instructionsRoomStatus: [String] = ["solved", "unlocked", "locked" ]
    
    static let instructionsLetsPlay: [String] = [
        "To smoothen your experience during Enigma, please enable the notifications for this app/website to receive important updates.",
        "Malpractice in any form will be dealt with seriously. Players are requested to report us of any such practices.",
        "Enigma is an individual player game and the players are requested to maintain the integrity of the game and not to divulge the solutions anywhere."
    ]
    
}

