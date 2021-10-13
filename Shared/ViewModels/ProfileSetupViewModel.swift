//
//  ProfileSetupViewModel.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/13/21.
//

import Foundation

class ProfileSetupViewModel: ObservableObject {
    @Published var username: String = ""
    var surveyOptions: [String] = ["Social Media", "Friends", "Other"]
    @Published var isCollegeStudent: Int = 1
    @Published var errorMessage: String? = nil
    var displayRules: Bool {
        username.count < 8
    }
    private var boolIsCollege: Bool {
        isCollegeStudent == 0 ? true : false
    }
    @Published var outreach: String = "Social Media"
    var profileSuccess: Bool = false
    
    
    func setupProfile() {
        APIClient.request(fromRouter: Router.profileSetup(ProfileSetupModel.Request(username: username, isCollegeStudent: boolIsCollege, outreach: outreach))) { (response: ProfileSetupModel.Response?,error) in
            if let error = error {
                self.errorMessage = error.debugDescription
                return
            }
            self.profileSuccess = true
           
        }
    }
    
}
