//
//  GoogleCoordinator.swift
//  Enigma (iOS)
//
//  Created by Shriram Alagarasan on 29/09/21.
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
                Logger.error(error?.localizedDescription ?? "")
                return
                
            }
            user?.authentication.do { authentication, error in
                  guard error == nil else { return }
                  guard let authentication = authentication else { return }

                  let idToken = authentication.idToken
                  // Send ID token to backend (example below).
                self.authVM.signInWithGoogle(with: idToken ?? "")
                
              }
            
        }
    }
    
}
