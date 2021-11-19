//
//  StoryView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/4/21.
//

import SwiftUI

struct CurrentStoryView: View {
    @StateObject var storyVM: StoryViewModel
    @EnvironmentObject var gameVM: GameViewModel
    var body: some View {
        VStack {
            StoryHeader().padding()
            ScrollView {
                ScrollViewReader { sr in
                    ForEach(storyVM.storySoFar) { message in
                        StoryBubble(story: message, width: UIScreen.main.bounds.width)
                            .id(message.id)
                    }
                    .onChange(of: storyVM.storySoFar.count) { _ in
                        Logger.debug("\(storyVM.storySoFar.count)")
                        withAnimation{
                            sr.scrollTo(storyVM.storySoFar.last?.id)
                        }
                    }
                }
            }
            
            //TODO: EMBED IN NAVLINK. ISACTIVE: storyVM.roomComplete
            NavigationLink(destination: RoomUI().environmentObject(gameVM), isActive: $storyVM.roomComplete) { EmptyView() }
                CustomButton(buttonText: storyVM.buttonTitle, action: storyVM.updateCurrentStory,bgroundColor: .eGold)
        }
        .background(Image(ImageConstants.storyBG).resizable()
                        .scaledToFill().edgesIgnoringSafeArea(.all))
        
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
