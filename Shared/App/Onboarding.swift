//
//  Onboarding.swift
//  Enigma (iOS)
//
//  Created by Alok N on 15/11/21.
//

import SwiftUI

struct Onboarding: View {
    @AppStorage(AppStorageConstants.onboarding) var onBoardShown: Bool = false
    @State var tabSelection = 0
    
    var body: some View {
        VStack(alignment: .trailing) {
            TabView(selection: $tabSelection) {
                ForEach(0 ..< AppConstants.onBoardingScreens.count) { i in
                    OnboardingPageView(details: AppConstants.onBoardingScreens[i])
                        .tag(i)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            Button(action: nextButton) {
                if(tabSelection < 2) {
                    Image(systemName: tabSelection < 2 ? "chevron.right" : "")
                        .frame(width:30, height: 30)
                        .foregroundColor(Color.eGold)
                } else {
                    CustomLabel(text: "Get Started")
                }
            }
            .offset(x: -30, y: -45)
            .frame(height: 16)
        }
        .background(Color.eBlack)
        .ignoresSafeArea()
    }
    
    func nextButton() {
        if tabSelection < 2 {
            withAnimation {
                self.tabSelection += 1
            }
        } else {
            self.onBoardShown = true
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
