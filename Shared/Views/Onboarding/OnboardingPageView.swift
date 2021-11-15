//
//  OnboardingPageView.swift
//  Enigma (iOS)
//
//  Created by Alok N on 15/11/21.
//

import SwiftUI

struct OnboardingPageView: View {
    var details: AppConstants.OnBoarding
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .center) {
                Spacer()
                Image("ENIGMA")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 40)
                    .frame(width: geo.size.width*0.6)
                Image(details.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 50)
                    .frame(width: geo.size.width*0.7)
                Text(details.heading)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10)
                    .font(.Mulish(weight: .bold))
                    .foregroundColor(Color.eGold)
                Text(details.subHeading)
                    .multilineTextAlignment(.center)
                    .font(.Mulish(size: 14, weight: .regular))
                    .foregroundColor(Color.eGold)
                Spacer()
            }
        }
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(details: AppConstants.onBoardingScreens[0])
    }
}
