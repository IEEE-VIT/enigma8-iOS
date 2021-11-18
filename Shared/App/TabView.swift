//
//  TabView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/18/21.
//

import SwiftUI

struct EnigmaTabView: View {
    @Binding var tabSelected: Int
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<AppConstants.tabBarIcons.count) { i in
                HStack {
                    Spacer()
                    Button(action: {
                        tabSelected = i
                    }, label: {
                        VStack(alignment: .center) {
                            Image(AppConstants.tabBarIcons[i])
                                .resizable()
                                .scaledToFit()
                                .frame(height: 23)
                            Text(AppConstants.tabBarIcons[i])
                                .font(.Mulish(size: 10, weight: .regular))
                                .foregroundColor(Color.eGold)
                        }
                    })
                        .padding(.vertical,8)
                    Spacer()
                }
                .background(tabSelected == i ? Color.storyGrey : Color.eBlack)
            }
        }
        .background(Color.eBlack)
    }
}

struct EnigmaTabView_Previews: PreviewProvider {
    @State static var tabSelected = 0
    static var previews: some View {
        EnigmaTabView(tabSelected: $tabSelected)
    }
}
