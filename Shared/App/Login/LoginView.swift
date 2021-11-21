//
//  LoginView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/5/21.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - PROPERTIES
    @ObservedObject var authVM: AuthViewModel
    @ObservedObject var googleVM : GoogleCoordinator
    @ObservedObject var appleVM : AppleCoordinator
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing:15) {
            Spacer()
            EnigmaLogo()
            Spacer()
            Group {
                SocialButton(action: appleVM.signInWithApple, image: .apple)
                SocialButton(action: googleVM.googleSignin, image: .google)
            }
            .padding(.horizontal,40)
            NavigationLink(destination: ProfileSetupView().navigationBarTitle("").navigationBarHidden(true),isActive: $authVM.isNew) {
                EmptyView()
            }
            NavigationLink(destination: HeaderNavView().navigationBarTitle("").navigationBarHidden(true), isActive: Binding<Bool>(get: {return !authVM.isNew && authVM.isSignedIn}, set: {p in self.authVM.isNew = p})) { EmptyView() }
            .padding(40)
        }
        .background(OnboardingBackground())
    }
}

// MARK: - PREVIEWS
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authVM: AuthViewModel(), googleVM: GoogleCoordinator(authVM: AuthViewModel()), appleVM: AppleCoordinator(authVM: AuthViewModel()))
            .edgesIgnoringSafeArea(.all)
    }
}
