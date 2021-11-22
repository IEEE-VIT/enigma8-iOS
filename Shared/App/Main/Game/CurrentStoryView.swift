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
    init(roomId: String) {
        self._storyVM = StateObject(wrappedValue: StoryViewModel(roomId: roomId))
    }
    
    var body: some View {
        VStack {
            EnigmaHeader(hideHeaderIcons: true, showInstructionsButton: false)
            
            StoryHeaderStack()
            .padding()
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
       
                    HStack(spacing: 0) {
                        Spacer(minLength: 100)
                        Button(action: storyVM.updateCurrentStory){
                            Text(storyVM.buttonTitle)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 5)
                                .foregroundColor(.black)
                                .background(Color.eGold)
                                .font(.Mulish(size: 14, weight: .semibold))
                                .cornerRadius(4)
                            Spacer(minLength: 100)
                        }
            }
            
        }
        .background(Image(ImageConstants.storyBG).resizable()
                        .scaledToFill().edgesIgnoringSafeArea(.bottom))
        .onAppear {
            storyVM.getStory()
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

struct StoryHeaderStack: View {
    
    @State var showCharDesc: Bool = false
    @State var character: Story = Story(roomNo: nil, sender: nil, message: nil)

    var body: some View {
        HStack {
            NavigationLink(destination: CharDescView(charDescriptions: character).navigationBarTitle("").navigationBarHidden(true), isActive: $showCharDesc) {EmptyView()}

            
        StoryHeader(sender: "Jones")
                .onTapGesture {
                    self.character = Story.chars[0]
                    self.showCharDesc = true
                }
            Spacer()
            StoryHeader(sender: "Ali")
                .onTapGesture {
                    self.character = Story.chars[1]
                    self.showCharDesc = true
                }
        }
    }
}
