//
//  TabView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/15/21.
//

import SwiftUI

struct TabBarView: View {
    var tabBarIcons: [String] = ["house", "chart.bar", "book","person.crop.circle"]
    var tabBarNames: [String] = ["Home", "Leaderboard", "Story","Profile"]
    @Binding var tabSelected: Int
    var body: some View {
        HStack {
            ForEach(0..<tabBarIcons.count) { i in
                Spacer()
                Button(action: {
                    tabSelected = i
                }, label: {
                    VStack {
                        Image(systemName: tabBarIcons[i])
                        Text(tabBarNames[i])
                            .font(.system(size: 10))
                    }
                    .foregroundColor(Color.black)
                })
                    .padding()
                Spacer()
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    @State static var tabSelected = 0
    static var previews: some View {
        TabBarView(tabSelected: $tabSelected)
            .previewLayout(.sizeThatFits)
    }
}
