//
//  StoryView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/4/21.
//

import SwiftUI

struct CurrentStoryView: View {
    @StateObject var storyVM: StoryViewModel
    var body: some View {
        VStack {
            ScrollView {
                ForEach(storyVM.storySoFar, id: \.self) { message in
                    HStack {
                        if message?.senderEnum == .sender2 {
                            Spacer()
                        }
                        StoryBubble(story: message ?? Story(roomNo: nil, sender: nil, message: nil))
                            .padding()
                        if message?.senderEnum == .sender1 {
                            Spacer()
                        }
                    }
                }
            }
            HStack {
                Spacer(minLength: 100)
                //TODO: EMBED IN NAVLINK. ISACTIVE: storyVM.roomComplete
                    CustomButton(buttonText: (storyVM.roomComplete ? "Continue": (storyVM.nextIndex == 0 ? "Start" : "Next")), action: storyVM.updateCurrentStory)
                Spacer(minLength: 100)
            }
        }
        .padding()
        .onAppear {
            storyVM.getStory()
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentStoryView(storyVM: StoryViewModel(roomId: "12345"))
    }
}
