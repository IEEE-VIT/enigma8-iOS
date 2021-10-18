//
//  LetsPlay.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import SwiftUI

struct LetsPlay: View {
    var instructionArray: [String] = [
        "Keep yourself updated with the notification log",
        "Don't cheat",
        "Contact us on our socials"
    ]
    var instructionArrayIcons: [String] = [
        "bell.badge",
        "xmark",
        "heart.circle.fill"
    ]
    var socialsArray = [
        "instagramicon",
        "twittericon"
    ]
    var body: some View {
        VStack {
            InstructionsHeader(viewName: "Let's Play")
            Spacer()
            VStack(alignment: .leading) {
                ForEach(0..<3) { index in
                    HStack {
                        Image(systemName: instructionArrayIcons[index])
                            .padding()
                        Text(instructionArray[index])
                    }
                }
            }
            VStack(alignment: .center) {
                ForEach(0..<2) { _ in
                    Label("ieeevitvellore",systemImage: "hand.thumbsup")
                        .padding(.bottom)
                }
            }
            Spacer()
            // TODO: wrap HStack in NavigationLink
            HStack {
                Spacer(minLength: 100)
                CustomButton(buttonText: "Next")
                Spacer(minLength: 100)
            }
            Spacer()
        }
        .padding()
    }
}

struct LetsPlay_Previews: PreviewProvider {
    static var previews: some View {
        LetsPlay()
    }
}
