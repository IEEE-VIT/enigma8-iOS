//
//  Gradient.swift
//  Enigma (iOS)
//
//  Created by Aaryan Kothari on 16/11/21.
//

import Foundation
import SwiftUI

extension LinearGradient {
    static let gold = LinearGradient(gradient: Gradient(colors: [.goldGradientStart, .goldGradientEnd]), startPoint: .top, endPoint: .bottom)
    
    static let blue = LinearGradient(gradient: Gradient(colors: [.blueGradientStart, .blueGradientEnd]), startPoint: .top, endPoint: .bottom)

}

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors),
                                    startPoint: .top,
                                    endPoint: .bottom))
            .mask(self)
    }
}
