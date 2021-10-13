//
//  ProfileSetupModel.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/13/21.
//

import Foundation

struct ProfileSetupModel {
    
    struct Request: Codable {
        var username: String?
        var isCollegeStudent: Bool = false
        var outreach: String?
    }
    struct Response: Codable {
        var message: String?
    }
    
}
