//
//  ProfileSetupView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/12/21.
//

import SwiftUI

struct ProfileSetupView: View {
    @StateObject var profileVM: ProfileSetupViewModel
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading) {
                //TODO: replace Setup your profile Text with navbarTitle once Navigation is set up
                Text("Setup your profile")
                    .font(.largeTitle)
                VStack(alignment: .leading) {
                    Text("Enter your username")
                        .font(.title)
                    Text("(This cannot be changed later)")
                        .font(.subheadline)
                    CustomTextField(textFieldString: "Enter your username", bindingString: $profileVM.username)
                    if profileVM.displayRules {
                        if profileVM.displayBoth {
                            Text("*\(ProfileSetupViewModel.countRule)\n*\(ProfileSetupViewModel.alphanumericsRule)")
                                .foregroundColor(Color.red)
                                .font(.caption)
                        }
                        else {
                            Text("*\(profileVM.displayCountRules ? ProfileSetupViewModel.countRule : ProfileSetupViewModel.alphanumericsRule)")
                                .foregroundColor(Color.red)
                                .font(.caption)
                        }
                    }
                    if let errorMessage = profileVM.errorMessage {
                        Text("*\(errorMessage)")
                            .foregroundColor(Color.red)
                            .font(.caption)
                    }

                    Text("How did you hear about Enigma?")
                        .font(.title2)
                        .padding(.top)
                }
                DropdownView(selectedOption: profileVM.outreach, dropdownOptions: profileVM.surveyOptions)
                    .frame(width: geo.size.width * 0.8)
                Spacer()
                HStack {
                    
                    NavigationLink(destination: TimeView(), isActive: $profileVM.profileSuccess) {
                        Spacer(minLength: 100)
                        CustomButton(buttonText: "Next", action: profileVM.setupProfile)
                        Spacer(minLength: 100)
                    }
                }
            }
            
        }
        .padding()
    }
}


struct ProfileSetupView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSetupView(profileVM: ProfileSetupViewModel())
    }
}
