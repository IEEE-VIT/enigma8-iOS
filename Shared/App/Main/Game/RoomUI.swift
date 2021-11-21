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
    @State var showHintConfirmation: Bool = false
    @EnvironmentObject var gameVM: GameViewModel
    @EnvironmentObject var rooms : RoomsViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    var hintAction: () -> Void = {}
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                EnigmaHeader(showBackButton: true,showInstructionsButton: false,backAction: back)
                HStack {
                    VStack(alignment: .leading) {
                        Text(gameVM.currentStatus?.room?.title ?? "")
                            .gradientForeground(colors: [.goldGradientStart, .goldGradientEnd])
                        Text("Q \(gameVM.roomStatus?.question?.questionNo ?? 1)")
                            .foregroundColor(Color.eBlue)
                    }
                    .font(.Cinzel(size: 20, weight: .regular))
                    .padding()
                    Spacer()
                    if !(gameVM.roomStatus?.powerupUsed == .yes) {
                    HStack {
                        KFImage(gameVM.roomStatus?.powerupDetails?.iconURL)
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text(gameVM.roomStatus?.powerupDetails?.name?.uppercased() ?? "Powerup")
                            .font(.Cinzel(size: 16))
                            .foregroundColor(.eBlue)
                    }.padding(10)
                        .onTapGesture(perform: {
                            if(gameVM.powerupFetched) {
                                gameVM.answerStatus = .powerup
                            } else {
                                if(gameVM.roomStatus?.powerupUsed == .yes) {
                                    gameVM.showPopup = true
                                    gameVM.answerStatus = .powerupUsed
                                } else if(gameVM.roomStatus?.powerupUsed == .active) {
                                    gameVM.usePowerup()
                                } else if(gameVM.roomStatus?.powerupUsed == .no) {
                                    gameVM.answerStatus = .powerupQuery
                                    gameVM.showPopup = true
                                }
                            }
                        })
                        .background(Color(white: 1, opacity: 0.05))
                    }
                }
                Group {
                    ScrollView {
                        Text(gameVM.roomStatus?.question?.text ?? "")
                            .font(.Mulish(size: 17))
                            .foregroundColor(Color.eGold)
                        switch(gameVM.roomStatus?.question?.mediaType ?? .img) {
                        case .img:
                            KFImage(gameVM.roomStatus?.question?.mediaURL)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        case .vid:
                            VideoPlayer(player: AVPlayer(url: gameVM.roomStatus?.question?.mediaURL ?? URL(string:"https://google.com")!)).aspectRatio(contentMode: .fit)
                        }
                        HStack {
                            TextField("Your Answer", text: $gameVM.answerText)
                                .autocapitalization(.none)
                                .accentColor(.eGold)
                                .padding()
                                .foregroundColor(.eGold)
                                .background(Color(white: 1, opacity: 0.05))
                            Button(action: {gameVM.answerStatus = .hintQuery;gameVM.showPopup = !gameVM.hintFetched ? true : false}) {
                                Image(ImageConstants.hint)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50)
                            }.foregroundColor(.black)
                        }.padding(.vertical)
                        if(gameVM.answerStatus == .wrong) {
                                Text("*Oops! Wrong answer. Try again")
                                    .foregroundColor(.red)
                                    .padding(.bottom)
                        }
                        if(gameVM.fetchedHint != "") {
                            HStack(spacing: 0) {
                                Text("Hint : ")
                                    .font(.Mulish(size: 16, weight: .bold))
                                Text(gameVM.fetchedHint)
                                    .font(.Mulish(size: 16))
                            }
                            .foregroundColor(Color.eBlue)
                        }
                        CustomButton(buttonText: "Submit", action: gameVM.submitAnswer, bgroundColor: .eGold)
                            .padding(.vertical)
                    }
                }.padding()
            }
            
        }
        .popup(isPresented: $gameVM.showPopup, animation: Animation.spring(), closeOnTap: false, dismissCallback: {gameVM.answerStatus = .none}) {
            switch(gameVM.answerStatus) {
            case .close:
                EnigmaAlert(title: "You are close to the answer!",text:" Keep Trying!", showCloseButton: true, closeAction: {gameVM.showPopup.toggle()})
            case .correct:
                EnigmaAlert(title: "Wohoo!\n You got the right answer!",text: "You've earned a key and \(gameVM.latestScore) points!", showCloseButton: true, closeAction: {
                    gameVM.showPopup.toggle()
                    if gameVM.roomStatus?.question?.questionNo == 3 {
                        self.back()
                    } else {
                    gameVM.getQuestion()
                    }
                }, image: "Key")
            case .nextRoom:
                EnigmaAlert(title: "Wohoo!\n You got the right answer!",text: "You've earned a key!",confirmText: "Go to another room", cancelText: "Continue in this room", confirmAction: {gameVM.navigateBackToRooms = true}, cancelAction: {gameVM.showPopup.toggle(); gameVM.getQuestion()}, image: "Key")
            case .hintQuery:
                EnigmaAlert(title: "Using hint will deduct points from your score", subtitle: "Are you sure to use a hint?",confirmText: "Confirm", showCloseButton:true, confirmAction: {gameVM.getHint();gameVM.showPopup.toggle()}, closeAction: {gameVM.showPopup.toggle()}, image: "Hint")
            case .powerupQuery:
                EnigmaAlert(title: "This powerup can be used only once in this room. Are you sure you want to use it for this question?",confirmText: "Confirm", showCloseButton:true, confirmAction: {gameVM.usePowerup();gameVM.showPopup.toggle()}, closeAction: {gameVM.showPopup.toggle()}, imageURL: gameVM.roomStatus?.powerupDetails?.iconURL)
            case .powerupUsed:
                EnigmaAlert(title: "You've already used this powerup!", showCloseButton:true, closeAction: {gameVM.showPopup.toggle()})
            case .powerup:
                EnigmaAlert(title: gameVM.fetchedPowerup?.text, subtitle: gameVM.fetchedPowerup?.data, showCloseButton: true, powerupIcon: gameVM.roomStatus?.powerupDetails?.iconURL, powerupImage: gameVM.fetchedPowerup?.imgURL, closeAction: {gameVM.showPopup.toggle()})
            default:
                EmptyView()
            }
        }
        .animation(.default)
        .background(Color.eBlack.edgesIgnoringSafeArea(.bottom))
        .onAppear(perform: gameVM.getQuestion)
        .navigationBarHidden(true)
    }
    
    func back() {
        
        if self.rooms.navigateToPowerups {
            self.rooms.navigateToPowerups = false
        } else {
            self.presentationMode.wrappedValue.dismiss()
        }
        Logger.info("HMM: \(self.rooms.navigateToPowerups)")
    }
}

struct RoomUI_Previews: PreviewProvider {
    static var previews: some View {
        RoomUI()
    }
}
