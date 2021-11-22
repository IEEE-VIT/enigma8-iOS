//
//  LetsPlayIcons.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/18/21.
//

import SwiftUI

struct LetsPlayIcons: View {
    var instructionsIcons: [String] = ["Notifications","Info"]
    var instructionsNames: [String] = ["Notifications","Instructions"]
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<2) { index in
                HStack {
                    Image(instructionsIcons[index])
                        .resizable()
                        .scaledToFit()
                        .frame(height: 18)
                    Text(": " + instructionsNames[index])
                        .font(.Mulish(size: 14, weight: .medium))
                        .foregroundColor(Color.eBlue)
                }
            }
        }
    }
}

struct LetsPlayIcons_Previews: PreviewProvider {
    static var previews: some View {
        LetsPlayIcons()
    }
}
