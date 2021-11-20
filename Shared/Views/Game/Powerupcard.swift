//
//  Powerupcard.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import SwiftUI

struct Powerupcard: View {
    @State var flipped: Bool = false
    var powerupImage: String = "x.square.fill"
    var powerupName: String = ""
    var powerupInfo: String = ""
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray)
            if flipped {
                HStack {
                    Spacer()
                    Image(systemName: powerupImage)
                    Spacer()
                    VStack {
                        Text(powerupName)
                            .fontWeight(.bold)
                        Text(powerupInfo)
                    }
                    .padding()
                    Spacer()
                }
                .padding()
            }
            else {
                VStack {
                    Image(systemName: powerupImage)
                    Text(powerupName)
                }
                .padding()
            }
        }
        .frame(height: 100)
        .onTapGesture {
            self.flipped.toggle()
        }
    }
}

struct Powerupcard_Previews: PreviewProvider {
    static var previews: some View {
        Powerupcard()
            .previewLayout(.sizeThatFits)
    }
}
