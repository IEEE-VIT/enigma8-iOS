//
//  AppleCoordinator.swift
//  Enigma (iOS)
//
//  Created by Alok N on 25/09/21.
//

import Foundation
import AuthenticationServices
import CryptoKit

class AppleCoordinator: NSObject, ASAuthorizationControllerDelegate {
    
    let authVM: AuthViewModel
    
    init(authVM: AuthViewModel){
        self.authVM = authVM
    }
    
    func signInWithApple() {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.email,.fullName]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.performRequests()
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            guard let appleIDToken = appleIDCredential.identityToken else {
                Logger.error("Unable to fetch Identity Token")
                return
            }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                Logger.error("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                return
            }
            guard let authCode = appleIDCredential.authorizationCode else {
                Logger.error("Unable to fetch Authorization Code")
                return
            }
            guard let authCodeString = String(data: authCode, encoding: .utf8) else {
                Logger.error("Unable to Serialize Authorization Code")
                return
            }
            self.authVM.signInWithApple(code: authCodeString, token: idTokenString)
        default:
            break
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        Logger.error(error.localizedDescription)
    }
    
}
