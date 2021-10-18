//
//  GameMechanics.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import SwiftUI

struct GameMechanics: View {
    var questionKey: [String] = [
        "Locked",
        "Solved",
        "Unlocked"
    ]
    var questionKeyIcons: [String] = [
        "dial.min.fill",
        "paintpalette.fill",
        "scribble"
    ]
    var sampleText = """
            Lorem ipsum dolor sit amet, consectetur adipiscing
            elit.
            Urna dictum massa diam laoreet suspendisse sed
            suspendisse senectus.
            Amet vitae et tellus curabitur commodo id.
            Consequat vestibulum, sed felis, sem tortor eget
            dictumst.
            Mattis sagittis, adipiscing ullamcorper velit euismod
            suscipit.
            """
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                InstructionsHeader(viewName: "Game Mechanics")
                Text(sampleText)
                HStack {
                    VStack {
                        HStack {
                            ForEach(questionKeyIcons, id: \.self) {
                                Image(systemName: $0)
                            }
                        }
                        Image(systemName: "square")
                            .resizable()
                            .scaledToFit()
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        ForEach(0..<3) { index in
                            HStack {
                                Text(questionKey[index])
                                    .font(.headline)
                                Image(systemName: questionKeyIcons[index])
                                    
                            }
                        }
                    }
                }
                .padding()
                Text(sampleText)
            }
            .padding()
        }
    }
}

struct GameMechanics_Previews: PreviewProvider {
    static var previews: some View {
        GameMechanics()
    }
}
