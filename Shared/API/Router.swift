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
    case instructions
    case profileSetup(ProfileSetupModel.Request)
    case currentStory(StoryModel.Request), fullStory
    case getPowerup
    case getQuestion(Question.Request)
    case selectPowerup(Powerup.SelectRequest)
    case leaderboard(Leaderboard.Request)
    case submitAnswer(Answer.Request)
    case notifications
    case getHint(Hint.Request)
    case usePowerup(Powerup.UseRequest)
    case addFCM(FCMRequest)
    
    case postFeedback(FeedbackModel)
    case checkFeedback
    
//   static let baseURL = URL(string: "https://enigma8.herokuapp.com/app")!
        
    static let baseURL = URL(string: "https://enigma-api.ieeevit.org/app")!
    
    var method: HTTPMethod {
        switch self {
        case .loginGoogle, .loginApple, .profileSetup, .selectPowerup, .submitAnswer,.postFeedback,.addFCM:
            return .post
        case .timer, .getUser, .allRooms, .unlockRoom, .leaderboard, .notifications, .getPowerup, .getQuestion, .getHint, .currentStory, .fullStory, .checkFeedback, .usePowerup, .instructions:
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
           return "static/apptimer/"
       //  return "static/app/timer/"
        case .instructions:
            return "static/rules"
        case .profileSetup:
            return "user/create/"
        case .currentStory:
            return "story/currentStory"
        case .fullStory:
            return "story/fullStory"
        case .allRooms:
            return "room/allRooms/"
        case .unlockRoom:
            return "room/checkIfRoomUnlocked"
        case .getPowerup:
            return "user/getPowerups/"
        case .selectPowerup:
            return "user/selectPowerup/"
        case .usePowerup:
            return "transact/usePowerup"
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
        case .postFeedback:
            return "feedback/submitFeedback"
        case .checkFeedback:
            return "feedback/feedbackFilled"
        case .addFCM:
            return "user/addFCM"
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
        case .profileSetup(let profileBody):
            return try self.encoder.encode(profileBody, into: request)
        case .currentStory(let roomId):
            return try self.encoder.encode(roomId, into: request)
        case .unlockRoom(let roomId):
            return try self.encoder.encode(roomId, into: request)
        case .selectPowerup(let powerupSelect):
            return try self.encoder.encode(powerupSelect, into:request)
        case .usePowerup(let powerup):
            return try self.encoder.encode(powerup, into: request)
        case .leaderboard(let leaderboardRequest):
            return try self.encoder.encode(leaderboardRequest, into: request)
        case .getQuestion(let questionRequest):
            return try self.encoder.encode(questionRequest, into: request)
        case .getHint(let hintRequest):
            return try self.encoder.encode(hintRequest, into: request)
        case .submitAnswer(let answerRequest):
            return try self.encoder.encode(answerRequest, into: request)
        case .postFeedback(let feedback):
            return try self.encoder.encode(feedback, into: request)
        case .addFCM(let fcm):
            return try self.encoder.encode(fcm, into: request)

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
