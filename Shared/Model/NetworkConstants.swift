//
//  NetworkConstants.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 9/27/21.
//

import Foundation

//MARK:- ENDPOINTS OF ALL ROUTES
/// USERS       &&      GAME

struct NetworkConstants {
        
    struct Users {
        public static let baseURL = "https://enigma8.herokuapp.com/api/v1/users/"
       
        
        public static let googleURL = baseURL + "auth/google/"
        public static let appleURL = baseURL + "auth/apple/"
        public static let editUsernameURL = baseURL + "me/edit/"
        public static let outreachURL = baseURL + "outreach/"
        public static let userDetailsURL = baseURL + "me/"
        public static let logoutURL = baseURL + "logout/"
    }

    
    struct Game {
        public static let baseURL = "https://enigma8.herokuapp.com/api/v1/game/"
        

        public static let leaderboardURL = baseURL + "leaderboard/"
        public static let questionURL = baseURL + "question/"
        public static let hintURL = baseURL + "hint/"
        public static let hintPowerupURL = baseURL + "powerup/hint/"
        public static let skipPowerupURL = baseURL + "powerup/skip/"
        public static let closeAnswerPowerupURL = baseURL + "powerup/close-answer/"
        public static let answerURL = baseURL + "answer/"
        public static let xpTimeURL = baseURL + "xp-time/"
        public static let status = baseURL + "status/"
        public static let storyURL = baseURL + "story/"
        public static let storyCompleteURL = baseURL + "story/complete/"
    }
    
}


