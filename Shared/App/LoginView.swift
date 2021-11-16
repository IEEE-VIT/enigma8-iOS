//
//  LoginView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/5/21.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - PROPERTIES
    @StateObject var authVM: AuthViewModel
    let googleVM : GoogleCoordinator
    let appleVM : AppleCoordinator
    
    // MARK: - INITIALIZE
    init(authVM: AuthViewModel) {
        self.appleVM = AppleCoordinator(authVM: authVM)
        self.googleVM = GoogleCoordinator(authVM: authVM)
        _authVM = StateObject(wrappedValue: authVM)
    }
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing:15) {
            
            Spacer()
            
            Image(ImageConstants.enigmaLogo)
                .resizable()
                .scaledToFit()
                .padding(36)
                .padding(.bottom,50)
            
            Spacer()
            
            Group {
                SocialButton(action: appleVM.signInWithApple, image: .apple)
                SocialButton(action: googleVM.googleSignin, image: .google)
            }
            .padding(.horizontal,40)
            
            Spacer()
            
            NavigationLink(destination: ProfileSetupView(),isActive: $authVM.isNew) {
                EmptyView()
            }
            NavigationLink(destination: HeaderNavView().navigationBarTitle("").navigationBarHidden(true), isActive: Binding<Bool>(get: {return !authVM.isNew && authVM.isSignedIn}, set: {p in self.authVM.isNew = p})) { EmptyView() }
        }
        .background(OnboardingBackground())
    }
}

// MARK: - PREVIEWS
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authVM: AuthViewModel())
            .edgesIgnoringSafeArea(.all)
    }
}
