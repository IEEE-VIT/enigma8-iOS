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
    case unlockRoom(RoomUnlock.RoomUnlockRequest)
    case timer, getUser, allRooms
    case profileSetup(ProfileSetupModel.Request)
    case currentStory(StoryModel.Request), fullStory(StoryModel.Request)
    case getPowerup
    case getQuestion(Question.Request)
    case selectPowerup(Powerup.SelectRequest)
    case leaderboard(Leaderboard.Request)
    case submitAnswer(Answer.Request)
    case notifications
    case getHint(Hint.Request)
    
    static let baseURL = URL(string: "https://enigma8.herokuapp.com")!
    
    var method: HTTPMethod {
        switch self {
        case .loginGoogle, .loginApple, .profileSetup, .selectPowerup, .submitAnswer:
            return .post
        case .timer, .getUser, .allRooms, .unlockRoom, .leaderboard, .notifications, .getPowerup, .getQuestion, .getHint, .currentStory, .fullStory:
            return .get
        }
    }

    var path: String {
        switch self {
        case .loginGoogle:
            return "auth/app/google/"
        case .loginApple:
            return "auth/app/apple/"
        case .timer:
            return "static/timer/"
        case .profileSetup:
            return "user/create/"
        case .currentStory:
            return "story/currentStory"
        case .fullStory:
            return "story/fullStory"
        case .allRooms:
            return "room/allRooms/"
        case .unlockRoom:
            return "room/checkIfRoomUnlocked/"
        case .getPowerup:
            return "user/getPowerups/"
        case .selectPowerup:
            return "user/selectPowerup/"
        case .leaderboard:
            return "game/leaderboards"
        case .notifications:
            return "notifs/notifications"
        case .getUser:
            return "user/getDetails/"
        case .getQuestion:
            return "transact/getQuestion"
        case .getHint:
            return "transact/useHint"
        case .submitAnswer:
            return "transact/submitAnswer"
        }
    }
    
    var parameters: [String: Any] {
        let params = [String: Any]()
        return params
    }
    
    var authString: String? {
        switch self {
        case .loginApple, .loginGoogle:
            return nil
        default:
            if(UserDefaults.standard.value(forKey: "EnigmaToken") != nil) {
                return "Bearer \(UserDefaults.standard.value(forKey: "EnigmaToken") ?? "")"
            } else {
                return nil
            }
        }
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
        case .currentStory(let roomId), .fullStory(let roomId):
            return try self.encoder.encode(roomId, into: request)
        case .unlockRoom(let roomId):
            return try self.encoder.encode(roomId, into: request)
        case .selectPowerup(let powerupSelect):
            return try self.encoder.encode(powerupSelect, into:request)
        case .leaderboard(let leaderboardRequest):
            return try self.encoder.encode(leaderboardRequest, into: request)
        case .getQuestion(let questionRequest):
            return try self.encoder.encode(questionRequest, into: request)
        case .getHint(let hintRequest):
            return try self.encoder.encode(hintRequest, into: request)
        case .submitAnswer(let answerRequest):
            return try self.encoder.encode(answerRequest, into: request)
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
