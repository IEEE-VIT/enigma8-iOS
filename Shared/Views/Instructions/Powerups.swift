//
//  Powerups.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import SwiftUI

struct Powerups: View {
    var sampleText = """
Lorem ipsum dolor sit amet, consectetur adipiscing
elit. Diam auctor et in velit.
"""
    var body: some View {
        ScrollView {
            VStack {
                InstructionsHeader(viewName: "Powerups")
                Text(sampleText)
                ForEach(0..<10) {
                    Powerupcard(powerupName: "Powerup \($0 + 1)", powerupInfo: "Information")
                        .padding(.horizontal)
                }
            }
        }
    }
}

struct Powerups_Previews: PreviewProvider {
    static var previews: some View {
        Powerups()
    }
}
