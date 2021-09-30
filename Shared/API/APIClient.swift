//
//  APIClient.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 9/26/21.
//

import Foundation
import Alamofire

class APIClient {
    
    static let sessionManager: Session = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 20
        let session = Session(configuration: config)
        return session
    }()
    
    class func request<T: Codable>(fromRouter router: Router, callback: @escaping (_ response: ApiResponse<T>?, _ error: String?) -> Void) {
        APIClient.sessionManager.request(router).responseDecodable { (response: DataResponse<T, AFError>) in
            switch response.result {
            case .success(let obj):
                print("SUCCESS: \(obj)")
                callback(obj as? ApiResponse<T>,nil)
            case .failure(let error):
                print("FAILURE2")
                print(error)
            }
            
            print(response.request?.url?.absoluteString ?? "")
            print(response.request?.headers ?? "")
            print(try? response.request?.httpBody?.toJSON())
        }
    }
    
}
