//
//  ProfileSetupView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/12/21.
//

import SwiftUI

struct ProfileSetupView: View {
    
    @StateObject var profileVM: ProfileSetupViewModel = ProfileSetupViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        GeometryReader { geo in
                VStack(alignment: .leading,spacing:35) {
                    EnigmaHeader(showBackButton: true, showInstructionsButton: false,backAction: back).environmentObject(HeaderRules()).ignoresSafeArea(.keyboard)
                        ScrollView {
                            VStack(alignment: .center) {
                                Image(ImageConstants.profileHeader)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geo.size.width*0.6, alignment: .center)
                                VStack (alignment: .leading) {
                                    CustomLabel(text:"Enter your username")
                                        .frame(alignment: .leading)
                                    CustomTextField(textFieldString: "Enter your username", bindingString: $profileVM.username)
                                        .frame(width: geo.size.width*0.85)
                                    Group {
                                        if(profileVM.errorMessage != nil) {
                                            Text(profileVM.errorMessage ?? "")
                                                .foregroundColor(.eRed)
                                                .font(.Mulish(size: 15, weight: .bold))
                                                .frame(width: geo.size.width*0.7, alignment: .leading)
                                        }
                                    }
                                    .padding(.bottom, 50)
                                    .padding(.leading)
                                    CustomLabel(text:"How did you hear about Enigma?")
                                    if(profileVM.selectError && profileVM.outreach == "-Select-") {
                                        Text("*Please select an option")
                                            .foregroundColor(.eRed)
                                            .font(.Mulish(size: 15, weight: .bold))
                                            .frame(width: geo.size.width*0.7, alignment: .leading)
                                            .padding(.vertical, 5)
                                    }
                                    CustomDropDown(width: geo.size.width*0.85, selectedOption: $profileVM.outreach, options: profileVM.surveyOptions)
                                        .padding(.bottom, 100)
                                }.padding(.vertical)
                            }
                            CustomButton(buttonText: "Submit", action: profileVM.setupProfile)
                                    .padding(.vertical, 70)
                            NavigationLink(destination: TimeView(), isActive: $profileVM.profileSuccess) { EmptyView() }
                }
            }
        }
        .background(OnboardingBackground().ignoresSafeArea(.keyboard,edges:.all))
        .navigationBarBackButtonHidden(true)
    }
    
    func back() {
        self.presentationMode.wrappedValue.dismiss()
    }
}


struct ProfileSetupView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSetupView(profileVM: ProfileSetupViewModel())
    }
}
