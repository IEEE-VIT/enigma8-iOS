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
    
    static let onBoardingScreens: [OnBoarding] = [OnBoarding(imageName: "Pharoah", heading: "Join Jones and Ali in their adventure\n through Egypt", subHeading: "Things take a turn for the worst when Jones and Ali wander through the depths of Egypt."),OnBoarding(imageName: "Rooms", heading: "Travel through 8 different rooms", subHeading: "Solve questions in each room to know more about the adventures of Jones and Ali"),OnBoarding(imageName: "Powerups", heading: "Use Power-Ups and Hint when stuck", subHeading: "Everyone needs help once in a while, use Power Ups and hints to solve questions whenever stuck :)")]
}

