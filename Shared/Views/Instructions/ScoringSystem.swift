//
//  ScoringSystem.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import SwiftUI

struct ScoringSystem: View {
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
        VStack {
            InstructionsHeader(viewName: "Scoring System")
            Spacer()
            Text(sampleText)
            Spacer()
        }
        .padding()
    }
}

struct ScoringSystem_Previews: PreviewProvider {
    static var previews: some View {
        ScoringSystem()
    }
}
