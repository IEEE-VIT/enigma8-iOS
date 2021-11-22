//
//  GameMechanics.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import SwiftUI

struct GameMechanics: View {
    var data: [String] = AppConstants.instructionsGameMechanics
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            ScrollView(showsIndicators:false) {
            VStack(alignment: .leading) {
                ForEach(data, id: \.self) { point in
                    HStack(alignment: .top) {
                        Image("BulletPoint")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 8)
                            .padding(.top, 5)
                        Text(point)
                            .font(.Mulish(size: 18, weight: .medium))
                            .foregroundColor(Color.eGold)
                    }
                }
                Spacer()
                HStack {
                    Image("Key")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                    Text(": Key")
                        .font(.Mulish(size: 14, weight: .regular))
                        .foregroundColor(Color.eBlue)
                }
                .padding()
                Spacer()
            }
            }
            }
            Spacer()
            HStack {
                Image("Key")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 35)
                Text(": Key")
                    .font(.Mulish(size: 14, weight: .regular))
                    .foregroundColor(Color.eBlue)
            }
            .padding()
            Spacer()
        }
        .padding()
    }
}

struct GameMechanics_Previews: PreviewProvider {
    static var previews: some View {
        GameMechanics()
    }
}
