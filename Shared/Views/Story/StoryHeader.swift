//
//  StoryHeader.swift
//  Enigma (iOS)
//
//  Created by Alok N on 19/11/21.
//

import SwiftUI

struct StoryHeader: View {
    var sender: String
    var body: some View {
        Image("unlocked")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height: 38)
        CustomLabel(text: sender, font: .Cinzel(size: 20, weight: .bold))
    }
}
