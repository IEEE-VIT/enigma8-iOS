//
//  PowerupRow.swift
//  Enigma (iOS)
//
//  Created by Alok N on 05/11/21.
//

import SwiftUI
import Kingfisher

struct PowerupRow: View {
    var powerup: Powerup.PowerupModel
    var width: CGFloat
    
    var body: some View {
        HStack(spacing:width * 0.05) {
                KFImage(URL(string: powerup.icon ?? ""))
                    .resizable()
                    .scaledToFit()
                    .frame(width: width * 0.16, height: width * 0.16)
                VStack(alignment: .leading) {
                    CustomLabel(text: powerup.name ?? "",font: .Cinzel(size: 17, weight: .bold))
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    Text(powerup.detail ?? "")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.eBlue)
                        .font(.Mulish(size: 14, weight: .semibold))
                        .lineLimit(3)
                        .minimumScaleFactor(0.5)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
        }
        .padding(width * 0.05)
        .background(RoundedRectangle(cornerRadius: 9).fill(Color.black).shadow(color: .eBlue.opacity(0.4), radius: 4, x: 0, y: 4))
        .padding(.horizontal,width * 0.08)
        
    }
}

struct PowerupRow_Previews: PreviewProvider {
    static var previews: some View {
        PowerupRow(powerup: Powerup.PowerupModel(name: "something", detail: "this is detailed powerup this is detailed this is detailed powerup this is detailed", icon: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/How_to_use_icon.svg/1920px-How_to_use_icon.svg.png", available: true),width: 360)
            .previewLayout(.sizeThatFits)
            .padding(20)
    }
}
