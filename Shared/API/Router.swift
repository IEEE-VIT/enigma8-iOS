//
//  Router.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 9/26/21.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    case loginGoogle(SignUpModel.Request)
    case loginApple(SignUpModel.AppleRequest)
    
    
    static let baseURL = URL(string: "https://enigma8.herokuapp.com")!
    
    var method: HTTPMethod {
        switch self {
        case .loginGoogle, .loginApple:
            return .post
        
        }
    }

    var path: String {
        switch self {
        case .loginGoogle:
            return "auth/app/google/"
        case .loginApple:
            return "users/auth/apple/"
        }
    }
    
    var parameters: [String: Any] {
        let params = [String: Any]()
        return params
    }
    
    var authString: String? {
        return "\(UserDefaults.standard.value(forKey: "EnigmaToken") ?? "")"
    }
        
    // For codable requests
    var encoder: ParameterEncoder {
        switch self.method {
        case .get:
            return URLEncodedFormParameterEncoder.default
        case .post, .put, .delete:
            return JSONParameterEncoder.default
        default:
            return URLEncodedFormParameterEncoder.default
        }
    }
    
    // For other requests
    var encoding: ParameterEncoding {
        switch self.method {
        case .get:
            return URLEncoding.default
        case .post, .put, .delete:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
    
    func encodeParameters(into request: URLRequest) throws -> URLRequest {
        switch self {
        case .loginGoogle(let body):
            return try self.encoder.encode(body, into: request)
        case .loginApple(let appleBody):
            return try self.encoder.encode(appleBody, into: request)
        default:
            return try self.encoding.encode(request, with: self.parameters)
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = Router.baseURL.appendingPathComponent(self.path)
        var request = URLRequest(url: url)
        request.httpMethod = self.method.rawValue
        request.setValue(self.authString, forHTTPHeaderField: "Authorization")
        
        request = try self.encodeParameters(into: request)
        
        return request
    }
    
}
