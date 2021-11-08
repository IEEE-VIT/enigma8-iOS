//
//  StoryViewModel.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/4/21.
//

import Foundation
import SwiftUI

class StoryViewModel: ObservableObject {
    @Published var story: [Story?] = []
    @Published var storySoFar: [Story?] = []
    @Published var fullStory: [Story?] = []
    @Published var fullStoryRoomwise = [String:[Story]]()
    @Published var fullStoryRoomIndex = 0
    @Published var fullStoryComplete = false
    var roomId: String? = ""
    @Published var nextIndex: Int = 0
    @Published var roomComplete = false
    init(roomId: String) {
        self.roomId = roomId
        getFullStory()
    }
    
    func getStory(){
        let request = StoryModel.Request(roomId: self.roomId ?? "")
        APIClient.request(fromRouter: .currentStory(request)) { (response: StoryModel.Response?,error) in
            if let error = error {
                Logger.error(error.debugDescription)
                return
            }
            self.story = response?.story ?? []
        }
        
    }
    
    func updateCurrentStory(){
        if self.story.count > 0 {
            if self.nextIndex < self.story.count {
                self.storySoFar.append(self.story[nextIndex])
                self.nextIndex += 1
            }
            if self.nextIndex == self.story.count {
                self.roomComplete = true
            }
        }
    }
    
    func getFullStory(){
        self.fullStoryRoomwise.removeAll()
        let request = StoryModel.Request(roomId: self.roomId ?? "")
        APIClient.request(fromRouter: .fullStory(request)) { (response: StoryModel.Response?, error) in
            if let error = error {
                Logger.error(error.debugDescription)
                return
            }
            self.fullStory = response?.story ?? []
            for i in 0..<self.fullStory.count  {
                if self.fullStoryRoomwise[self.fullStory[i]?.roomNo ?? "0"] == nil {
                    self.fullStoryRoomwise[self.fullStory[i]?.roomNo ?? "0"] = []
                }
                self.fullStoryRoomwise[self.fullStory[i]?.roomNo ?? "0"]?.append(self.fullStory[i] ?? Story(roomNo: "", sender: "", message: ""))
                
            }
        }
    }
    
    
}
