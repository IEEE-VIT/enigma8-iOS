//
//  APIClient.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 9/26/21.
//

import Foundation
import Alamofire

class APIClient {
    
    class func request<T: Codable>(fromRouter router: Router, callback: @escaping (_ response: T?, _ error: String?) -> Void) {
        AF.request(router)
            .responseDecodable { (response: DataResponse<ApiResponse<T>?, AFError>) in
                switch response.result {
                case .success(let object):
                    let success: Bool = object?.success ?? false
                    let data : T? = success ? object?.data : nil
                    let error: String? = success ? nil : object?.message ?? "Something went wrong"
                    callback(data,error)
                case .failure(let error):
                    Logger.error(error.errorDescription)
                    callback(nil,error.errorDescription ?? "Something went wrong")
                }
                
                Logger.info(response.request?.url?.absoluteString ?? "")
                Logger.info(try? response.request?.httpBody?.toJSON())
            }
            .responseJSON(completionHandler: APIClient.handleJSON(json:))
    }
    
    
    private class func handleJSON(json: AFDataResponse<Any>){
        Logger.info(try? json.data?.toJSON())
    }
}
