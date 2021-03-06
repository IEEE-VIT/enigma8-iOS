//
//  AuthViewModel.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 9/26/21.
//

import SwiftUI
import Combine

// MARK: - AUTHENTICATION VIEW MODEL

class AuthViewModel: ObservableObject {
    @AppStorage(AppStorageConstants.login) var userLoggedIn: Bool = false
    @Published var isSignedIn: Bool = false
    @Published var error: String = ""
    @Published var isNew: Bool = false
    
    func signInWithApple(code: String, token: String) {
        APIClient.request(fromRouter: Router.loginApple(SignUpModel.AppleRequest(code: code, access_token: token))) { (response: SignUpModel.Response?, error) in
            if let error = error {
                self.isSignedIn = false
                print(error.debugDescription)
                return
            }
            print(response ?? "Error parsing response from Backend")
            UserDefaults.standard.setValue(response?.jwt ?? "error", forKey: "EnigmaToken")
            self.isSignedIn = true
            self.isNew = response?.isNew ?? false
            Logger.debug("ISNEW: \(self.isNew)")
            if(!self.isNew) {
                self.userLoggedIn = true
            }
        }
    }
    
    func signInWithGoogle(with code: String) {
        APIClient.request(fromRouter: Router.loginGoogle(SignUpModel.Request(code: code, type: .google))){
            (response: SignUpModel.Response?, error) in
                if let error = error {
                    self.isSignedIn = false
                    print(error.debugDescription)
                    return
                }
            print(response ?? "Error parsing response from Backend")
            UserDefaults.standard.setValue(response?.jwt , forKey: "EnigmaToken")
            self.isSignedIn = true
            self.isNew = response?.isNew ?? false
            Logger.debug("ISNEW: \(self.isNew)")
            if(!self.isNew) {
                self.userLoggedIn = true
            }
        }
      
    }
    
}
