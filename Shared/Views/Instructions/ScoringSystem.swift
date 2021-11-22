//
//  ScoringSystem.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import SwiftUI

struct ScoringSystem: View {
    var data: [String] = AppConstants.instructionsScoringSystem
    var body: some View {
        VStack {
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
                }
                }
                }
                Spacer()
            }
        }
        .padding()
    }
}

struct ScoringSystem_Previews: PreviewProvider {
    static var previews: some View {
        ScoringSystem()
    }
}
