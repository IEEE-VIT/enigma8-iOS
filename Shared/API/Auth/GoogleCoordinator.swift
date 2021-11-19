//
//  GoogleCoordinator.swift
//  Enigma (iOS)
//
//  Created by Shriram Alagarasan on 29/09/21.
//

import SwiftUI
import GoogleSignIn

// MARK: - SIGNIN WITH GOOGLE COORDINATOR

class GoogleCoordinator: NSObject, ObservableObject {
    @Published var authVM: AuthViewModel
    let signInConfig: GIDConfiguration
    
    init(authVM: AuthViewModel) {
        self.authVM = authVM
        self.signInConfig = GIDConfiguration.init(clientID: AppConstants.Google.clientId, serverClientID: AppConstants.Google.serverClientId)
        super.init()
    }
   
    func googleSignin() {
        let vc = (UIApplication.shared.windows.last?.rootViewController)!
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: vc) { user, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
                
            }
            user?.authentication.do { authentication, error in
                
                guard let idToken = authentication?.idToken else {
                    Logger.error(error?.localizedDescription)
                    return
                }
                
                self.authVM.signInWithGoogle(with: idToken)
                
            }
        }
    }
    
}
