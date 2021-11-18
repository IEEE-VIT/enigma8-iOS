//
//  EnigmaLogo.swift
//  Enigma (iOS)
//
//  Created by Aaryan Kothari on 17/11/21.
//

import SwiftUI

struct EnigmaLogo: View {
    var body: some View {
        Image(ImageConstants.enigmaLogo)
            .resizable()
            .scaledToFit()
            .padding(36)
            .padding(.bottom,50)
    }
}

struct EnigmaLogo_Previews: PreviewProvider {
    static var previews: some View {
        EnigmaLogo()
    }
}
