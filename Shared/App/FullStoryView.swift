//
//  FullStoryView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/8/21.
//

import SwiftUI

struct FullStoryView: View {
    @StateObject var storyViewModel: StoryViewModel
    var body: some View {
        VStack {
            if storyViewModel.fullStoryRoomwise.count > 0 {
                Text("Room \(storyViewModel.fullStoryRoomIndex + 1)")
                    .font(.largeTitle)
                TabView(selection: $storyViewModel.fullStoryRoomIndex){
                    ForEach(0..<storyViewModel.fullStoryRoomwise.count) { index in
                        RoomWiseStory(roomStory: storyViewModel.fullStoryRoomwise["\(index+1)"] ?? [])
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            } else {
                Spacer()
                Text("Loading Stories!")
                Spacer()
            }
        }
        .onAppear{
            storyViewModel.getFullStory()
        }
    }
}

struct FullStoryView_Previews: PreviewProvider {
    static var previews: some View {
        FullStoryView(storyViewModel: StoryViewModel(roomId: ""))
    }
}
