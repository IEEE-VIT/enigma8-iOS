//
//  RoomUI.swift
//  Enigma (iOS)
//
//  Created by Alok N on 15/10/21.
//

import SwiftUI
import Kingfisher
import AVKit

struct RoomUI: View {
    //STATIC DATA WILL MOVE TO VIEWMODEL
    @StateObject var gameVM = GameViewModel()
    @State var answerText = ""
    var hintAction: () -> Void = {}
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Room \(gameVM.currentStatus.roomNo)")
                        Text("Q\(gameVM.currentStatus.question.questionNo)")
                    }.padding()
                    Spacer()
                    HStack {
                        Image(systemName: "bell")
                        Text(gameVM.currentStatus.chosenPowerup)
                    }.padding()
                        .background(Color(white: 0, opacity: 0.2))
                }
                Group {
                    Text(gameVM.currentStatus.question.question)
                    switch(gameVM.currentStatus.question.mediaType) {
                    case .image:
                        KFImage(gameVM.currentStatus.question.mediaURL)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    case .video:
                        VideoPlayer(player: AVPlayer(url: gameVM.currentStatus.question.mediaURL)).aspectRatio(contentMode: .fit)
                    }//TODO: SET FRAME FOR BOTH VIDEO AND IMAGE
                    HStack {
                        TextField("Your Answer", text: $answerText)
                            .autocapitalization(.none)
                            .padding()
                            .border(.black, width: 3)
                        Button(action: hintAction) {
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
                    CustomButton(buttonText: "Submit", bgroundColor: Color(white: 0, opacity: 0.2))
                }.padding()
            }
        }
    }
}

struct RoomUI_Previews: PreviewProvider {
    static var previews: some View {
        RoomUI()
    }
}
