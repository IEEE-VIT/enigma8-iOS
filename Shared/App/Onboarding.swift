//
//  Onboarding.swift
//  Enigma (iOS)
//
//  Created by Alok N on 15/11/21.
//

import SwiftUI

struct Onboarding: View {
    @State var tabSelection = 0
    @State var navigate = false
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                //TODO: Change Destination
                NavigationLink(destination: RoomsView(), isActive: $navigate) {EmptyView()}
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
                        Button(action: { self.navigate = true }) {
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
