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
    @Published var storySoFar: [Story] = []
    @Published var fullStory: [Story] = []
    var roomId: String? = ""
    @Published var nextIndex: Int = 0
    @Published var roomComplete = false
    @Published var buttonTitle: String = "Start"
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
        withAnimation {
            if self.story.count > 0 {
                if self.nextIndex < self.story.count {
                    guard let story = self.story[nextIndex] else { return }
                    self.storySoFar.append(story)
                    self.nextIndex += 1
                }
                if self.nextIndex == self.story.count {
                    self.roomComplete = true
                }
            }
            self.buttonTitle = roomComplete ? "Continue": (nextIndex == 0 ? "Start" : "Next")
        }
    }
    
    func getFullStory(){
        APIClient.request(fromRouter: .fullStory) { (response: StoryModel.Response?, error) in
            guard let fullStory = response?.story as? [Story] else {
                Logger.error(error.debugDescription)
                return
            }
            self.fullStory = fullStory
        }
    }
    
    
}
