//
//  LetsPlay.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import SwiftUI

struct LetsPlay: View {
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 20) {
                VStack(alignment: .leading) {
                    ForEach(AppConstants.instructionsLetsPlay, id: \.self) { point in
                        HStack(alignment: .top) {
                            Image("BulletPoint")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 8)
                                .padding(.top, 5)
                            Text(point)
                                .font(.Mulish(size: 12, weight: .medium))
                                .foregroundColor(Color.eGold)
                        }
                        .padding(.vertical)
                    }
                }
                Spacer()
                LetsPlayIcons()
                Spacer()
                HStack {
                    CustomButton(buttonText: "Next")
                }
                Spacer()
            }
        }
    }
}

struct LetsPlay_Previews: PreviewProvider {
    static var previews: some View {
        LetsPlay()
    }
}
