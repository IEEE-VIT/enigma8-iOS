//
//  AppConstants.swift
//  Enigma (iOS)
//
//  Created by Shriram Alagarasan on 27/09/21.
//

import Foundation

//MARK:- APP CONSTANTS ( STRINGS )

struct AppConstants {
    
    static let privacy = "https://enigma.ieeevit.org/static/media/Privacy.6b994fbf.pdf"
    
    struct Error {
        static let usernameErrorPrefix = "________________\nInvalidUsername.\n-> "
        static let emptyAnswer = "Answer can not be empty!"
        static let emptyUsername = "Username Empty!"
        static let emptySource = "Where did you hear abous us?"
        static let emptyYear = "when will you graduate"
        static let specialCharacters = "Special charcaters are not allowed!"
        static let uhOh = "Uh oh 😕"
        static let misc = "An Error occured :("
    }
    
    struct Image {
        static let share = "share"
        static let hint = "Hint"
    }
    
    struct Date {
        static let startDate = "2020-12-04 16:20:00"
        static let dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    
    struct Google {
        static let clientId = "55484635453-2fmn476nlr2it49soaejbeqj29lq0k6k.apps.googleusercontent.com"
        static let serverClientId = "55484635453-c46tes445anbidhb2qnmb2qs618mvpni.apps.googleusercontent.com"
    }
    
    struct Story {
        static let username = " <username> "
        static let username2 = "  <username>  "
        static let lineBreak = " <br> "
        static let lineBreak2 = "<br>"
    }
    
    struct Rules {
        static let rules = [
            "ENIGMA 8.0 is an online cryptic hunt where players solve a series of challenging riddles and puzzles to win exciting prizes.",
            "The points earned on answering each question are completely relative to the competition - the earlier you solve a question, the higher your score will be. These points determine your position on the leaderboard.",
            "Upon using a hint, a one-time penalty of 10 points shall be applied on the points earned from the corresponding question.",
            "Every player will have xp (experience points) which can be redeemed to use power ups.",
            "xp does not play a part in determining the leaderboard position and is different from “points” mentioned.",
            "All players start with 0 xp and can collect a maximum of 100 xp.",
            "Players earn xp every hour and upon solving the questions.",
            "There are three different power ups that players can redeem from the collected xp.",
            "The first power up, Free hint (consumes 50 xp), gives the player the hint to the question without the penalty to their points.",
            "The second power up, Skip question (consumes 75 xp), the players can skip the current question but will not be awarded any points.",
            "The third power up (consumes 100 xp along with a reduction of 10 points), Close answer, the players can successfully move to the next question and earn points for the question.",
            "Any form of malpractice shall be dealt with extreme seriousness. We are constantly trying to enhance the experience and security of the system. Your cooperation is highly appreciated."
        ]
    }
    
}
