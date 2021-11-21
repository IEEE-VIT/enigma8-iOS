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
    @EnvironmentObject var rooms : RoomsViewModel
    @AppStorage(AppStorageConstants.charactersShown) var charsShown: Bool = false

    init(roomId: String) {
        self._storyVM = StateObject(wrappedValue: StoryViewModel(roomId: roomId))
    }
    
    var body: some View {
        VStack {
            EnigmaHeader(hideHeaderIcons: true, showInstructionsButton: false)
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
            NavigationLink(destination: RoomUI().environmentObject(gameVM).environmentObject(rooms), isActive: $storyVM.roomComplete) { EmptyView() }
                CustomButton(buttonText: storyVM.buttonTitle, action: storyVM.updateCurrentStory,bgroundColor: .eGold)
        }
        .background(Image(ImageConstants.storyBG).resizable()
                        .scaledToFill().edgesIgnoringSafeArea(.bottom))
        .onAppear {
            storyVM.getStory()
        }
        .sheet(isPresented: Binding<Bool>(get: {return !self.charsShown},
                                          set: { p in self.charsShown = p})) {
            CharDescView()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentStoryView(roomId: "181")
    }
}
