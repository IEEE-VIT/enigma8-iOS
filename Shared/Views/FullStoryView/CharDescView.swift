//
//  CharDescView.swift
//  Enigma (iOS)
//
//  Created by Alok N on 20/11/21.
//

import SwiftUI

struct CharDescView: View {
    @AppStorage(AppStorageConstants.charactersShown) var charsShown: Bool = false
    var charDescriptions: [Story]
    @State var index: Int = 0
    var imageName: String = "unlocked"
    var body: some View {
        ScrollView {
            VStack {
                if(charDescriptions.count > 0) {
                    HStack {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        CustomLabel(text: charDescriptions[index].sender ?? "", font: .Cinzel(size: 20, weight: .bold))
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                    }
                    VStack {
                        Image("charPath")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .rotation3DEffect(.degrees(180), axis: (x: 1, y: 1, z: 0))
                            .frame(width: 60)
                            .offset(x: UIScreen.main.bounds.width/2-65, y: -5)
                        Text(charDescriptions[index].message ?? "")
                            .font(.Mulish(size: 17))
                            .padding(.horizontal, 10)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.eBlue)
                        Image("charPath")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60)
                                .offset(x: -(UIScreen.main.bounds.width/2-60), y: 0)
                    }.background(Color.eBlack)
                    .frame(width: UIScreen.main.bounds.width-60)
                    .border(LinearGradient.gold)
                    .padding(.vertical)
                    CustomButton(buttonText: "Continue")
                } else {
                    Text("Loading")
                }
            }.padding(.vertical, 40)
        }
        .frame(maxHeight: .infinity, alignment: .leading)
        .background(Image(ImageConstants.charBG).resizable().scaledToFill())
    }
    
    func nextChar() {
        if(index < charDescriptions.count - 1) {
            index += 1
        } else {
            charsShown = true
        }
    }
}

struct CharDescView_Previews: PreviewProvider {
    static var previews: some View {
        CharDescView(charDescriptions: [Story(roomNo: "", sender: "", message: "")])
    }
}
