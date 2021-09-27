//
//  GoogleSignInCoordinator.swift
//  Enigma (iOS)
//
//  Created by Shriram Alagarasan on 26/09/21.
//

import SwiftUI
import GoogleSignIn

// MARK: - SIGNIN WITH GOOGLE COORDINATOR

class GoogleCoordinator: NSObject {
    var authVM: AuthViewModel
    let signInConfig: GIDConfiguration
    init(authVM: AuthViewModel) {
        self.authVM = authVM
        self.signInConfig = GIDConfiguration.init(clientID: AppConstants.Google.clientId, serverClientID: AppConstants.Google.serverClientId)
        super.init()
    }
   // google sign in flow
    func googleSignin() {
        let vc = (UIApplication.shared.windows.last?.rootViewController)!
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: vc) { user, error in
            guard let error = error else {
                print(error?.localizedDescription ?? "")
                return
            }
         self.authVM.signInWithGoogle(with: user?.serverAuthCode ?? "")
        }
    }
    
}
