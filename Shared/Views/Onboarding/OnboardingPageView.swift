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
            VStack(alignment: .center) {
                Image(ImageConstants.enigmaOnlyLogo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.vertical, 40)
                    .frame(width: UIScreen.main.bounds.width * 0.5)
                Image(details.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(25)
                Spacer()
                Text(details.heading)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10)
                    .font(.Mulish(weight: .bold))
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                    .foregroundColor(Color.eGold)
                Text(details.subHeading)
                    .multilineTextAlignment(.center)
                    .font(.Mulish(size: 14, weight: .regular))
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                    .foregroundColor(Color.eGold)
                    .padding(.bottom,50)
            }
            .frame(maxWidth:.infinity)
            .padding(.horizontal,40)
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(details: AppConstants.onBoardingScreens[0])
            .background(Color.eBlack)
            .edgesIgnoringSafeArea(.all)
    }
}
