//
//  RoomUI.swift
//  Enigma (iOS)
//
//  Created by Alok N on 15/10/21.
//

import SwiftUI
import Kingfisher
import AVKit
import PopupView

struct RoomUI: View {
    @StateObject var gameVM = GameViewModel(currentStatus: RoomsModel())
    @State var showHintConfirmation: Bool = false
    var hintAction: () -> Void = {}
    
    var body: some View {
        ZStack {
            NavigationLink(destination: RoomsView(), isActive: $gameVM.navigateBackToRooms) {EmptyView()}
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(gameVM.currentStatus?.room?.title ?? "")
                        Text("Q \(gameVM.currentQuestion?.questionNo ?? 1)")
                    }.padding()
                    Spacer()
                    HStack {
                        Image(systemName: "bell")
                        Text("Powerup")//TODO: Convert to Backend Value
                    }.padding()
                        .background(Color(white: 0, opacity: 0.2))
                }
                Group {
                    ScrollView {
                        Text(gameVM.currentQuestion?.text ?? "")
                        switch(gameVM.currentQuestion?.mediaType ?? .img) {
                        case .img:
                            KFImage(gameVM.currentQuestion?.mediaURL)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        case .vid:
                            VideoPlayer(player: AVPlayer(url: gameVM.currentQuestion?.mediaURL ?? URL(string:"https://google.com")!)).aspectRatio(contentMode: .fit)
                        }
                    }
                    HStack {
                        TextField("Your Answer", text: $gameVM.answerText, onCommit: gameVM.submitAnswer)
                            .autocapitalization(.none)
                            .padding()
                            .border(.black, width: 3)
                        Button(action: {gameVM.showPopup = true;showHintConfirmation = true}) {
                            VStack {
                                Image(systemName: "lightbulb")
                                Text("Hint")
                                    .font(.system(size: 10))
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                            .background(Color(white: 0, opacity: 0.1))
                            .cornerRadius(100)
                        }.foregroundColor(.black)
                    }
                    if(gameVM.answerStatus == .wrong) {
                        Text("*Oops! Wrong answer. Try again")
                            .foregroundColor(.red)
                    }
                    CustomButton(buttonText: "Submit", action: gameVM.submitAnswer, bgroundColor: Color(white: 0, opacity: 0.2))
                }.padding()
            }
            
        }.popup(isPresented: $gameVM.showPopup, animation: Animation.spring(), closeOnTap: false) {
            switch(gameVM.answerStatus) {
            case .close:
                EnigmaAlert(text: "You are close to the answer! Keep Trying!", confirmAction: {gameVM.showPopup.toggle()}, cancelAction: {gameVM.showPopup.toggle()})
            case .correct:
                EnigmaAlert(text: "Wohoo! You got the right answer! You've earned a key.", confirmAction: {gameVM.showPopup.toggle(); gameVM.getQuestion()})
            case .nextRoom:
                EnigmaAlert(text: "Wohoo! You got the right answer! You've earned a key.", confirmText: "Go To Next Room", cancelText: "Stay in this Room",confirmAction: {gameVM.navigateBackToRooms = true}, cancelAction: {gameVM.showPopup.toggle(); gameVM.getQuestion()})
            default:
                EmptyView()
            }
            if(showHintConfirmation) {
                if(!gameVM.hintFetched) {
                    EnigmaAlert(text: "Using this hint will cause to reduce points. Are you sure to use a hint?", confirmAction: gameVM.getHint, cancelAction: {gameVM.showPopup.toggle()})
                } else {
                    //TODO: Make Single button hint
                    EnigmaAlert(text: gameVM.fetchedHint, confirmAction: {gameVM.showPopup.toggle();showHintConfirmation = false}, cancelAction: {gameVM.showPopup.toggle(); showHintConfirmation = false;})
                }
            }
        }
        .onAppear(perform: gameVM.getQuestion)
        .navigationBarHidden(true)
    }
}

struct RoomUI_Previews: PreviewProvider {
    static var previews: some View {
        RoomUI()
    }
}
