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

    var body: some View {
        VStack {
            Spacer()
            Text("ENIGMA")
                .font(.title)
            Spacer()
            CustomButton(buttonText: "Sign up with Google",action: googleVM.googleSignin)
                .padding(.horizontal,40)
            CustomButton(buttonText:"Sign up with Apple", action: appleVM.signInWithApple)
                .padding(.horizontal,40)
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authVM: AuthViewModel())
    }
}
