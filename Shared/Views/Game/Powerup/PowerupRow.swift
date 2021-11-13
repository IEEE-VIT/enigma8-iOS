//
//  PowerupRow.swift
//  Enigma (iOS)
//
//  Created by Alok N on 05/11/21.
//

import SwiftUI
import Kingfisher

struct PowerupRow: View {
    var powerup: Powerup.PowerupModel = Powerup.PowerupModel(name: "something", detail: "this is detailed powerup this is detailed this is detailed powerup this is detailed", icon: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/How_to_use_icon.svg/1920px-How_to_use_icon.svg.png", available: true)
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: powerup.icon!))
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .leading)
                VStack(alignment: .leading) {
                    Text(powerup.name!)
                        .bold()
                        .font(.system(size: 20))
                        .padding(.bottom, 2)
                    Text(powerup.detail!)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding()
            Divider()
        }
    }
}

struct PowerupRow_Previews: PreviewProvider {
    static var previews: some View {
        PowerupRow()
    }
}
