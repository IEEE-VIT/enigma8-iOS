//
//  ProfileSetupViewModel.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/13/21.
//

import Foundation
import SwiftUI

class ProfileSetupViewModel: ObservableObject {
    
    @AppStorage(AppStorageConstants.login) var userSetUp: Bool = false
    @Published var username: String = ""
    var surveyOptions: [String] = ["Instagram", "Facebook", "Reddit", "LinkedIn", "Discord", "Word of mouth", "Other"]
    @Published var errorMessage: String? = nil
    @Published var selectError: Bool = false
    static let countRule = "minimum 8 characters"
    static let alphanumericsRule = "no special characters"
    var displayCountRules: Bool {
        username.count < 8
    }
    @Published var responseSuccess: Int? = 0
    var displayAlphanumericsRule: Bool {
        return !username.isEmpty && username.range(of: "[^a-zA-Z0-9]", options: .regularExpression) != nil // this won't allow spaces or hyphens
    }
    var displayRules: Bool {
        displayCountRules || displayAlphanumericsRule
    }
    var displayBoth: Bool {
        displayCountRules && displayAlphanumericsRule
    }
    
    @Published var outreach: String = "-Select-"
    var profileSuccess: Bool = false
    
    func setupProfile() {
        if(outreach == "-Select-") {
            self.selectError = true
            return
        } else {
            self.selectError = false
        }
        let request = ProfileSetupModel.Request(username: username, outreach: outreach)
        APIClient.request(fromRouter: .profileSetup(request)) { (response: ProfileSetupModel.Response?,error) in
            if let error = error {
                self.errorMessage = "*\(error)"
                return
            }
            print(response ?? "Error parsing response from Backend")
            self.profileSuccess = true
            self.userSetUp = true
            self.responseSuccess = 1
           
        }
    }
    
}
