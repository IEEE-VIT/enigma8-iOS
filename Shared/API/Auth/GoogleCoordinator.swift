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
        self.signInConfig = GIDConfiguration.init(clientID: "to do", serverClientID: "to do")
        super.init()
    }
   
    
    // google sign in flow
    func googleSignin() {
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: (UIApplication.shared.windows.last?.rootViewController)!) { user, error in
            guard error == nil,user != nil else {
                print(error?.localizedDescription ?? "")
                return
            }
      // TODO: self.authVM.signinWithGoogle(with: user?.serverAuthCode ?? "")
        }
    }
    
}
