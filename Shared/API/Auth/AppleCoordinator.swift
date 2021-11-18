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
    private var currentNonce: String?
    
    func signInWithApple() {
        let nonce = randomNonceString()
        currentNonce = nonce
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.email,.fullName]
        request.nonce = sha256(nonce)
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.performRequests()
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        Logger.debug("APPLE SIGNIN")
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            
            guard let nonce = currentNonce else {
                fatalError("Invalid state: A login callback was received, but no login request was sent.")
            }
            
            guard let appleIDToken = appleIDCredential.identityToken else {
                print("Unable to fetch Identity Token")
                return
            }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                return
            }
            guard let authCode = appleIDCredential.authorizationCode else {
                print("Unable to fetch Authorization Code")
                return
            }
            guard let authCodeString = String(data: authCode, encoding: .utf8) else {
                print("Unable to Serialize Authorization Code")
                return
            }
            
            Logger.debug(authCodeString)
            self.authVM.signInWithApple(code: authCodeString, token: idTokenString)
        default:
            Logger.error("ERROR")
            break
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
    }
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: Array<Character> =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
                }
                return random
            }
            
            randoms.forEach { random in
                if length == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
    
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
}
