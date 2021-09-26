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
    
    @Published var isSignedIn: Bool = false
    @Published var error: String = ""
    
    
    func signInWithApple(code: String, token: String) {
        // code
    }
    func signInWithGoogle(with code: String) {
        // code
    }
    func forgotPassword() {
        // code
    }
    func logout() {
        // code
    }
    
}
