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
            guard error == nil else {
                Logger.error("THIS IS AN ERROR")
                return
                }
            guard let user = user else {
                Logger.error("THIS IS AN ERROR")
                return }
                user.authentication.do { authentication, error in
                guard error == nil else {
                    Logger.error("THIS IS AN ERROR")
                    return }
                guard let authentication = authentication else {
                    Logger.error("THIS IS AN ERROR")
                    return }
                    let idToken = authentication.idToken
                // Send ID token to backend
            }
            self.authVM.signInWithGoogle(with: user.serverAuthCode ?? "")
        }
    }
}
