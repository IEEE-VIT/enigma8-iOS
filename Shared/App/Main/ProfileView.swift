//
//  ProfileView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/5/21.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage(AppStorageConstants.onboarding) var onboarded: Bool = false
    @AppStorage(AppStorageConstants.login) var userLoggedIn: Bool = true
    @AppStorage(AppStorageConstants.enigmaStarted) var enigmaStarted: Bool = true
    @AppStorage(AppStorageConstants.instructionsShown) var instructionsShown: Bool = false
    @EnvironmentObject var userVM: RoomsViewModel
    @Binding var showPrivacyPolicy: Bool
    var body: some View {
        VStack {
            ProfileViewHeader(showPrivacyPolicy: $showPrivacyPolicy)
                .padding(.bottom,30)
            Spacer()
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Group {
                            Text("Username: ")
                            Text("Score: ")
                            Text("Rank: ")
                            Text("Keys: ")
                            Text("Email: ")
                            }
                            .font(.Mulish(size: 18, weight: .semibold))
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        }
                        .foregroundColor(Color.eGold)

                        VStack(alignment: .leading, spacing: 10) {
                            Group {
                            Text(self.userVM.user?.username ?? "username")
                            Text("\(self.userVM.user?.score ?? 0)")
                            Text("\(self.userVM.user?.rank ?? 0)")
                            Text("\(self.userVM.user?.stars ?? 0)")
                            Text(self.userVM.user?.email ?? "email@email.com")
                        }
                        .font(.Mulish(size: 18, weight: .semibold))
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        }
                        .foregroundColor(Color.eBlue)
                        Spacer()
                    }
                    .font(.Mulish(size: 18, weight: .semibold))
                }
                .padding()
                Text("PROGRESS")
                    .font(.Mulish(size:22, weight: .regular))
                    .foregroundColor(Color.eGold)
                    .padding(20)
               
                RoomProgressView(width: UIScreen.main.bounds.width * 0.66)
                Spacer()
                HStack {
                    CustomButton(buttonText:"LOGOUT", action: {
                        userLoggedIn = false
                        enigmaStarted = false
                        userVM.resetAll()
                        UserDefaults.standard.set(nil, forKey: AppStorageConstants.fullStory)
                        UserDefaults.standard.set(nil, forKey: AppStorageConstants.feedbackFilled)

                        UserDefaults.standard.set(nil, forKey: AppStorageConstants.instructionsShown)
                        UserDefaults.standard.set(nil, forKey: AppStorageConstants.journey)
                        UserDefaults.standard.set(false, forKey: AppStorageConstants.login)

                        // TODO clear remaining defaults
                    })
                }
                .padding(.vertical,40)
                
            }
        }
        .padding()
        .background(Image("UserProfileViewBG").resizable().frame(width: UIScreen.main.bounds.width))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(showPrivacyPolicy: .constant(false))
    }
}
