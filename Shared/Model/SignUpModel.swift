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
       
        init(code: String,type : SignupType){
            self.code = code
        }
        private enum CodingKeys: String, CodingKey {
            case code = "id_token"
        }
    }
    
    struct AppleRequest : Encodable {
        let code : String
        let access_token : String
        
        init(code:String, access_token:String){
            self.code = code
            self.access_token = access_token
        }
        
        private enum CodingKeys: String, CodingKey {
            case access_token = "token"
        }
    }
    
    struct Response : Codable {
        var jwt: String?
        var isNew: Bool?
        
        private enum CodingKeys: String, CodingKey {
            case jwt = "JWT"
            case isNew
        }
    }
}

enum SignupType : String{
    case google = "google"
    case apple = "apple"
    
    var isGoogle : Bool {
        return self == .google
    }
    
    var ButtonImage: String {
        return self.rawValue
    }
}
