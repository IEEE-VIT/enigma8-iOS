//
//  CharDescView.swift
//  Enigma (iOS)
//
//  Created by Alok N on 20/11/21.
//

import SwiftUI

struct CharDescView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var charDescriptions: Story = Story.chars[0]
    var imageName: String = "unlocked"
    
    var body: some View {
        
        GeometryReader { gr in
            VStack {
                EnigmaHeader(showBackButton: true,showInstructionsButton: false ,backAction: back)
                Spacer()
            VStack {
                    HStack {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        CustomLabel(text: charDescriptions.sender ?? "", font: .Cinzel(size: 20, weight: .bold))
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                    }
                    VStack(spacing:0) {
                    
                        Image("charPath")
                            .resizable()
                            .scaledToFit()
                            .rotationEffect(.degrees(180))
                            .frame(width: gr.size.width * 0.9,height: gr.size.width * 0.152,alignment: .topTrailing)
                        
                            Text(charDescriptions.message ?? "")
                                .font(.Mulish(size: 17))
                                .padding(.horizontal, 10)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.eBlue)
                                .minimumScaleFactor(0.5)
                         
   
                        Image("charPath")
                            .resizable()
                            .scaledToFit()
                            .frame(width: gr.size.width * 0.9,height: gr.size.width * 0.152,alignment: .leading)
                        
                   
                    }
                    .frame(width: gr.size.width * 0.9)
                    .aspectRatio(0.75, contentMode: .fit)
                    .background(Color.eBlack)
                    .border(LinearGradient.gold)
                    .padding(.vertical)
                
                Spacer()
                
            }.padding(.vertical, 40)
        }
        .frame(maxHeight: .infinity, alignment: .leading)
        .background(Image(ImageConstants.charBG).resizable().scaledToFill().edgesIgnoringSafeArea(.bottom))
    }
    }
    
    func back() {
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct CharDescView_Previews: PreviewProvider {
    static var previews: some View {
        CharDescView(charDescriptions: Story.chars[0])
    }
}
