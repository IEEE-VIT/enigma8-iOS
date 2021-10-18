//
//  InstructionsHeader.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import SwiftUI

struct InstructionsHeader: View {
    var viewName: String
    var body: some View {
        VStack {
            Image(systemName: "bolt.car")
            Text(viewName.uppercased())
                .font(.largeTitle)
        }
        .padding()
    }
}

struct InstructionsHeader_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsHeader(viewName: "Game Mechanics")
            .previewLayout(.sizeThatFits)
    }
}
