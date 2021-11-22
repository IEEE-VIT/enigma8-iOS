//
//  Powerups.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import SwiftUI

struct Powerups: View {
    var data: [String] = AppConstants.instructionsPowerups
    var body: some View {
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
            Image("Powerups_onboarding")
                .resizable()
                .scaledToFit()
                .padding()
            Spacer()
        }
        .padding(.horizontal)
    }
}
}

struct Powerups_Previews: PreviewProvider {
    static var previews: some View {
        Powerups()
    }
}
