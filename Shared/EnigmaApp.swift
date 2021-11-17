//
//  EnigmaApp.swift
//  Shared
//
//  Created by Aaryan Kothari on 07/09/21.
//

import SwiftUI

@main
struct EnigmaApp: App {
    
    init() {
        PodHelper.configurePods()
    }
    
    var body: some Scene {
        WindowGroup {
            CurrentStoryView(storyVM: StoryViewModel(roomId: "616165bc22fc9fa672b9849a"))
        }
    }
}
