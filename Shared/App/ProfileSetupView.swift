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
        GeometryReader { geo in
            VStack(alignment: .leading,spacing:35) {
                Image(ImageConstants.profileHeader)
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal,75)
                
                VStack(alignment: .leading) {
                    CustomLabel(text:"Enter your username")
                    CustomTextField(textFieldString: "Enter your username", bindingString: $profileVM.username)
                        .padding(.bottom,100)
                    CustomLabel(text:"How did you hear about Enigma?")
                }
                DropdownView(selectedOption: profileVM.outreach, dropdownOptions: profileVM.surveyOptions)
                    .frame(width: geo.size.width * 0.8)
                Spacer()
                HStack {
                    
                    NavigationLink(destination: TimeView(), isActive: $profileVM.profileSuccess) {
                        
                        CustomButton(buttonText: "Submit", action: profileVM.setupProfile)
                    }
                }
            }
            .padding(32)
            .background(OnboardingBackground())
        }
        .navigationBarBackButtonHidden(true)
        
    }
}


struct ProfileSetupView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSetupView(profileVM: ProfileSetupViewModel())
            .edgesIgnoringSafeArea(.all)
    }
}
