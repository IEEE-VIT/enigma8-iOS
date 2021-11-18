//
//  Colors.swift
//  Enigma (iOS)
//
//  Created by Alok N on 15/11/21.
//

import SwiftUI

extension Color {
    //TODO convert all colors to hex and remove from assets
    static let eBlue = Color(UIColor(named: ColorConstants.blue.rawValue)!)
    static let eSecondaryBlue = Color(UIColor(named: ColorConstants.secondaryBlue.rawValue)!)
    static let eRed = Color(UIColor(named: ColorConstants.red.rawValue)!)
    static let eGold = Color(UIColor(named: ColorConstants.gold.rawValue)!)
    static let eBlack = Color(UIColor(named: ColorConstants.black.rawValue)!)
    static let egrey = Color(UIColor(named: ColorConstants.grey.rawValue)!)

    static let storyGrey = Color(UIColor(named: ColorConstants.chat.rawValue)!)

    static let blueGradientStart = Color(UIColor(named: ColorConstants.blueGradientStart.rawValue)!)
    static let blueGradientEnd = Color(UIColor(named: ColorConstants.blueGradientEnd.rawValue)!)
    static let goldGradientStart = Color(UIColor(named: ColorConstants.goldGradientStart.rawValue)!)
    static let goldGradientEnd = Color(UIColor(named: ColorConstants.goldGradientEnd.rawValue)!)
    
    static let roomGreen = Color(hex: ColorConstants.roomGreen.rawValue)
    static let roomBlue = Color(hex: ColorConstants.roomBlue.rawValue)
    static let roomGrey = Color(hex: ColorConstants.roomGrey.rawValue)

    
    enum ColorConstants: String {
        case black = "Black"
        case grey = "Grey"
        case blue = "Blue"
        case secondaryBlue = "SecondaryBlue"
        case red = "Coral Red"
        case gold = "Gold"
        case blueGradientStart = "GBStart"
        case blueGradientEnd = "GBEnd"
        case goldGradientStart = "GGStart"
        case goldGradientEnd = "GGEnd"
        case chat = "Chat"
        
        
        case roomGreen = "#4FEF9A"
        case roomBlue = "#4DA9E5"
        case roomGrey = "#F2F2F2"
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
