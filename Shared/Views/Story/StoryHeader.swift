//
//  StoryHeader.swift
//  Enigma (iOS)
//
//  Created by Alok N on 19/11/21.
//

import SwiftUI

struct StoryHeader: View {
    var sender1: String = "MJ"
    var sender2: String = "Ali"
    
    var body: some View {
        HStack {
            Image("unlocked")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 60)
            CustomLabel(text: sender1, font: .Cinzel(size: 20, weight: .bold))
            Spacer()
            CustomLabel(text: sender2, font: .Cinzel(size: 20, weight: .bold))
            Image("unlocked")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 60)
        }
    }
}

struct StoryHeader_Previews: PreviewProvider {
    static var previews: some View {
        StoryHeader()
    }
}
