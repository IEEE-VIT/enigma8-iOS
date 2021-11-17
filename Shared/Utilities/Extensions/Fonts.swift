//
//  Fonts.swift
//  Enigma (iOS)
//
//  Created by Alok N on 15/11/21.
//

import Foundation
import SwiftUI

extension Font {
    public static func Cinzel(size: CGFloat = 20,weight:Font.Weight = .bold) -> Self {
        return .custom(weight.CinzelFontName, size: size)
    }
    public static func Mulish(size: CGFloat = 20, weight: Font.Weight = .semibold) -> Self {
        return .custom(weight.MulishFontName, size: size)
    }
}

extension Font.Weight {
    var CinzelFontName: String {
        switch self {
        case .bold: return "CinzelDecorative-Regular"
        case .semibold: return "Cinzel-Bold"
        case .regular: return "CinzelDecorative-Regular"
        default: return "Cinzel-Bold"
        }
    }
    var MulishFontName: String {
        switch self {
        case .bold: return "Mulish-Bold"
        case .semibold: return "Mulish-SemiBold"
        case .regular: return "Mulish-Regular"
        default: return "Mulish-Semibold"
        }
    }
}
