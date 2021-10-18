//
//  InstructionsView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import SwiftUI

struct InstructionsView: View {
    var body: some View {
        VStack {
            TabView {
                GameMechanics()
                ScoringSystem()
                Powerups()
                LetsPlay()
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView()
    }
}


