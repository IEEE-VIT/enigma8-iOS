//
//  OnboardingBackground.swift
//  Enigma (iOS)
//
//  Created by Aaryan Kothari on 16/11/21.
//

import SwiftUI

struct OnboardingBackground: View {
    var body: some View {
        Image(ImageConstants.onboardingBG).resizable().scaledToFill()
            .edgesIgnoringSafeArea(.bottom)
    }
}

struct OnboardingBackground_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingBackground()
    }
}
