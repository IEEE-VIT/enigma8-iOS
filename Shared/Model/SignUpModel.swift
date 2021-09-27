//
//  SignUpModel.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 9/27/21.
//

import Foundation

final class SignUpModel {
    
    class Request : Codable {
        let code : String?
        let callback_url : String?
        
        init(code: String,type : SignupType){
            self.code = code
            self.callback_url = type.callback
        }
    }
    
    struct AppleRequest : Encodable {
        let code : String
        let access_token : String
        
        init(code:String, access_token:String){
            self.code = code
            self.access_token = access_token
        }
    }
    
    struct Response : Codable {
        var key : String?
        var username_exists : Bool?
    }
}

enum SignupType : String{
    case google
    case apple
    
    var url : String {
        switch self {
        case .google:
            return NetworkConstants.Users.googleURL
        case .apple:
            return NetworkConstants.Users.appleURL
        }
    }
    
    var callback : String {
        switch self {
        case .google:
            return "http://127.0.0.1:8000/"
        case .apple:
            return "TODO"
        }
    }
    
    var isGoogle : Bool {
        return self == .google
    }
}
