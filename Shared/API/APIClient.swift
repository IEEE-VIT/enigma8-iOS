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
    
    class func request<T: Codable>(fromRouter router: Router, callback: @escaping (_ response: T?, _ error: String?) -> Void) {
            APIClient.sessionManager.request(router).responseDecodable { (response: DataResponse<ApiResponse<T>?, AFError>) in
                switch response.result {
                case .success(let obj):
                    print("SUCCESS: \(obj)")
                    callback(obj?.data,nil)
                    
                case .failure(let error):
                    print("FAILURE")
                    print(error)
                    callback(nil,"\(error)")
                }
            
            print(response.request?.url?.absoluteString ?? "")
            print(response.request?.headers ?? "")
            print(try? response.request?.httpBody?.toJSON())
            }
    }
    
}
