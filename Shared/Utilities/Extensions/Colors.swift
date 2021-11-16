//
//  Colors.swift
//  Enigma (iOS)
//
//  Created by Alok N on 15/11/21.
//

import SwiftUI

extension Color {
    static let eBlue = Color(UIColor(named: ColorConstants.blue.rawValue)!)
    static let eSecondaryBlue = Color(UIColor(named: ColorConstants.secondaryBlue.rawValue)!)
    static let eRed = Color(UIColor(named: ColorConstants.red.rawValue)!)
    static let eGold = Color(UIColor(named: ColorConstants.gold.rawValue)!)
    static let eBlack = Color(UIColor(named: ColorConstants.black.rawValue)!)
    static let egrey = Color(UIColor(named: ColorConstants.grey.rawValue)!)

    static let blueGradientStart = Color(UIColor(named: ColorConstants.blueGradientStart.rawValue)!)
    static let blueGradientEnd = Color(UIColor(named: ColorConstants.blueGradientEnd.rawValue)!)
    static let goldGradientStart = Color(UIColor(named: ColorConstants.goldGradientStart.rawValue)!)
    static let goldGradientEnd = Color(UIColor(named: ColorConstants.goldGradientEnd.rawValue)!)
    
    
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
    }
}
