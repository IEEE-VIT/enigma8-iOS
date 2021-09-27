//
//  APIResponse.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 9/28/21.
//

import Foundation

class ApiResponse<T: Codable>: Codable {
    
    var success: Bool? = false
    var data: T?
    var message: String? = ""
    
    private enum CodingKeys: String, CodingKey {
        case success
        case data
        case message
    }
}
