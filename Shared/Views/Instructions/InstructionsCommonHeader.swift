//
//  InstructionsCommonHeader.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/18/21.
//

import SwiftUI

struct InstructionsCommonHeader: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                CustomLabel(text: "INSTRUCTIONS",font: .Cinzel(size: 24, weight: .bold))
                Spacer()
            }
        }
    }
}

struct InstructionsCommonHeader_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsCommonHeader()
    }
}
