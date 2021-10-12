//
//  ProfileSetupView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/12/21.
//

import SwiftUI

struct ProfileSetupView: View {
    @State var username: String = ""
    var surveyOptions: [String] = ["Social Media", "Friends", "Other"]
    
    @State var isCollegeStudent: Int = 1
    private var displayRules: Bool {
        username.count < 8
    }
    var usernameTaken: Bool = false
    var body: some View {
        VStack {
            Text("Setup your profile") // this will be replaced by the navbar title
                .font(.largeTitle)
            Spacer()
            VStack(alignment: .leading) {
                Text("Enter your username")
                    .font(.title)
                Text("(This cannot be changed later)")
                    .font(.subheadline)
                TextField("Enter your username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.top)
                
                if displayRules {
                    Text("*minimum 8 characters")
                        .foregroundColor(Color.red)
                        .font(.caption)
                }
                Text("*no special characters allowed")
                    .foregroundColor(Color.red)
                    .font(.caption)
                if usernameTaken {
                    Text("*This username is already taken. Try another")
                        .foregroundColor(Color.red)
                        .font(.caption)
                }
                RadioButtonGroup(titleText: "Are you a college student?", options: ["Yes","No"])
                    .padding()
                Text("How did you hear about Enigma?")
                    .font(.title2)
                    .padding(.top)
                HStack {
                    DropdownView(selectedOption: surveyOptions[0], dropdownOptions: surveyOptions)
                    Spacer(minLength: 100)
                }
                
            }
            Spacer()
            Button(action: {}) {
                Text("Next")
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .foregroundColor(.black)
            }
            .background(Color.gray)
            .cornerRadius(10)
            .padding()
        }.padding()
        
    }
}

struct ProfileSetupView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSetupView()
    }
}
