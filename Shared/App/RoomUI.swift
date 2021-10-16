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
    var roomNumber = 1
    var questionNumber = 1
    var powerup = "Something"
    var question = "This is a lorem ipsum question This is a lorem ipsum questionThis is a lorem ipsum question This is a lorem ipsum question This is a lorem ipsum question This is a lorem ipsum question This is a lorem ipsum question This is a lorem ipsum question"
    var mediaURL = URL(string: "https://pbs.twimg.com/media/EoS2HGIU4AArhRT.jpg:large")
    //var mediaURL = URL(string: "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_1280_10MG.mp4")
    enum QMediaType {
        case image, video
    }
    let mediaType = QMediaType.image
    @State var answerText = ""
    var hintAction: () -> Void = {}
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Room \(roomNumber)")
                        Text("Q\(questionNumber)")
                    }.padding()
                    Spacer()
                    HStack {
                        Image(systemName: "bell")
                        Text(powerup)
                    }.padding()
                        .background(Color(white: 0, opacity: 0.2))
                }
                Group {
                    Text(question)
                    switch(mediaType) {
                    case .image:
                        KFImage(mediaURL)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    case .video:
                        VideoPlayer(player: AVPlayer(url: mediaURL!)).aspectRatio(contentMode: .fit)
                    }//TODO: SET FRAME FOR BOTH VIDEO AND IMAGE
                    HStack {
                        TextField("Your Answer", text: $answerText)
                            .autocapitalization(.none)
                            .padding()
                            .border(.black, width: 3)
                        Button(action: {}) {
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
