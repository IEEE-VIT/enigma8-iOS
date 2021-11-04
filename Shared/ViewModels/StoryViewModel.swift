//
//  StoryViewModel.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/4/21.
//

import Foundation
import SwiftUI

class StoryViewModel: ObservableObject {
    var story: String? = nil
    var fullStory: [String?] = []
    var roomId: String? = ""
    
    init(roomId: String) {
        self.roomId = roomId
    }
   
    func getStory(){
        let request = StoryModel.Request(roomId: self.roomId ?? "")
        APIClient.request(fromRouter: .currentStory(request)) { (response: StoryModel.Response?,error) in
            if let error = error {
                Logger.error(error.debugDescription)
                return
            }
            self.story = response?.story?[0]
        }
        
    }
    
    func getFullStory(){
        let request = StoryModel.Request(roomId: self.roomId ?? "")
        APIClient.request(fromRouter: .fullStory(request)) { (response: StoryModel.Response?, error) in
            if let error = error {
                Logger.error(error.debugDescription)
                return
            }
            self.fullStory = response?.story ?? []
        }
    }
    
}
