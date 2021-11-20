//
//  ProfileSetupView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/12/21.
//

import SwiftUI

struct ProfileSetupView: View {
    
    @StateObject var profileVM: ProfileSetupViewModel = ProfileSetupViewModel()
    
    var body: some View {
        ZStack {
            OnboardingBackground()
        GeometryReader { geo in
            VStack(alignment: .leading,spacing:35) {
                EnigmaHeader(showBackButton: true,  showInstructionsButton: false).frame(height:60).environmentObject(HeaderRules()).ignoresSafeArea(.keyboard)
                    VStack(alignment: .leading) {
                        Image(ImageConstants.profileHeader)
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal,75)
                            .padding(.bottom)
                        CustomLabel(text:"Enter your username")
                        CustomTextField(textFieldString: "Enter your username", bindingString: $profileVM.username)
                            .padding(.bottom,100)
                        Spacer()
                        CustomLabel(text:"How did you hear about Enigma?")
                    }.padding(.horizontal, 32)
                    .frame(height: geo.size.height*0.3)
                    DropdownView(selectedOption: profileVM.outreach, dropdownOptions: profileVM.surveyOptions)
                        .frame(width: geo.size.width * 0.8)
                        .padding(.horizontal, 32)
                Spacer()
                HStack {
                    
                    NavigationLink(destination: TimeView(), isActive: $profileVM.profileSuccess) {
                        
                        CustomButton(buttonText: "Submit", action: profileVM.setupProfile)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        }
    }
}


struct ProfileSetupView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSetupView(profileVM: ProfileSetupViewModel())
    }
}
