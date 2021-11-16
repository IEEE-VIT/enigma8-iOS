//
//  Onboarding.swift
//  Enigma (iOS)
//
//  Created by Alok N on 15/11/21.
//

import SwiftUI

struct Onboarding: View {
    @AppStorage("onBoardShown") var onBoardShown: Bool = false
    @State var tabSelection = 0
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    TabView(selection: $tabSelection) {
                        ForEach(0 ..< AppConstants.onBoardingScreens.count) { i in
                            OnboardingPageView(details: AppConstants.onBoardingScreens[i])
                            .tag(i)
                            .frame(width: geo.size.width*0.9)
                        }
                    }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .background(Color.eBlack)
                    if(tabSelection < 2) {
                        Button(action: { tabSelection += 1 }) {
                            Image(systemName: "chevron.right")
                                .frame(width:30, height: 30)
                                .foregroundColor(Color.eGold)
                        }.frame(width: geo.size.width*0.8, height: geo.size.height*0.9, alignment: .bottomTrailing)
                    } else {
                        Button(action: {self.onBoardShown = true}) {
                            Text("Get Started")
                                .font(.Mulish(weight: .bold))
                                .foregroundColor(Color.eGold)
                        }.frame(width: geo.size.width*0.8, height: geo.size.height*0.9, alignment: .bottomTrailing)
                    }
                }
            }.ignoresSafeArea()
            .navigationBarHidden(true)
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
