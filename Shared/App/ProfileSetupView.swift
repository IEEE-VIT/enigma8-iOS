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
                        Text("*minimum 8 characters")
                            .foregroundColor(Color.red)
                            .font(.caption)
                    }
                    Text("*no special characters allowed")
                        .foregroundColor(Color.red)
                        .font(.caption)
                    if let errorMessage = profileVM.errorMessage {
                        Text("*\(errorMessage)")
                            .foregroundColor(Color.red)
                            .font(.caption)
                    }
                    RadioButtonGroup(titleText: "Are you a college student?", options: ["Yes","No"], selected: $profileVM.isCollegeStudent)
                        .padding()
                    Text("How did you hear about Enigma?")
                        .font(.title2)
                        .padding(.top)
                }
                DropdownView(selectedOption: profileVM.outreach, dropdownOptions: profileVM.surveyOptions)
                    .frame(width: geo.size.width * 0.8)
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: TimeView(), isActive: $profileVM.profileSuccess) {
                        Button(action: profileVM.setupProfile) {
                            Text("Next")
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .foregroundColor(.black)
                        }
                    }
                    .background(Color.gray)
                    .cornerRadius(10)
                    .padding()
                    Spacer()
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
