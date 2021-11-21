//
//  InstructionsHeader.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import SwiftUI

struct InstructionsHeader: View {
    var viewName: String
    @Binding var selectedTab: Int
    var backButton: Bool {
        selectedTab == 0 ? false : true
    }
    var frontButton: Bool {
        selectedTab == 4 ? false : true
    }
    var body: some View {
        
        VStack {
            Image(viewName)
                .resizable()
                .scaledToFit()
                .frame(height: 44)
            HStack {
                if (backButton) {
                    Button(action : {
                        selectedTab -= 1
                    }, label: {
                        Image("BackButton")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 16)
                    })
                }
                CustomLabel(text: viewName.uppercased(),font: .Cinzel(size: 21, weight: .bold), gradient: .blue)
                    .padding(.top, 3)
                if (frontButton) {
                    Button(action : {
                        selectedTab += 1
                    }, label: {
                        Image("ForwardButton")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 16)
                    })                }
            }
        }
        .padding(.top)
    }
}

struct InstructionsHeader_Previews: PreviewProvider {
    @State static var selectedTab = 1
    static var previews: some View {
        InstructionsHeader(viewName: "Game Mechanics", selectedTab: $selectedTab)
//            .previewLayout(.sizeThatFits)
    }
}
