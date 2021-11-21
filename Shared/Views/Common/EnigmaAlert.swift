//
//  EnigmaAlert.swift
//  Enigma (iOS)
//
//  Created by Alok N on 15/10/21.
//

import SwiftUI
import Kingfisher

struct EnigmaAlert: View {
    var title: String? //= "Wohoo!\n You got the right answer."
    var subtitle: String? //= "Using this will reduce points."
    var text: String? //= "You've earned a key!"
    var confirmText: String? //= "Confirm"
    var cancelText: String? //= "Cancel"
    var showCloseButton: Bool = false
    var powerupIcon: URL?
    var powerupImage: String?
    var confirmAction: () -> Void = {print("Clicked Confirm")}
    var cancelAction: () -> Void = {print("Clicked Cancel")}
    var closeAction: () -> Void = {print("Clicked Close")}
    var image: String? //= "Key"
    var imageURL: URL?
    var widthPercentage = 0.65
        
    var body: some View {
        GeometryReader { geo in
                
            VStack(spacing:0) {
                    if(showCloseButton) {
                        Button(action: closeAction) {
                            Image("closeButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                        }.frame(width: geo.size.width * widthPercentage + 44, height: 50, alignment: .topTrailing)
                            .offset(x: 25, y: 30)
                            .zIndex(1)
                    }
                
                VStack(spacing: 20) {
                    if(powerupIcon != nil) {
                        KFImage(powerupIcon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width * 0.13, height: geo.size.width * 0.13)
                    }
                    
                    if(title != nil) {
                        Text(title ?? "")
                            .font(.Mulish(size: 19, weight: .bold))
                            .foregroundColor(Color.eBlue)
                            .multilineTextAlignment(.center)
                    }
                    
                    if(subtitle != nil) {
                        Text(subtitle ?? "")
                            .font(.Mulish(size: 17, weight: .semibold))
                            .foregroundColor(Color.eBlue)
                            .multilineTextAlignment(.center)
                    }
                    
                    if(text != nil) {
                        Text(text ?? "")
                            .font(.Mulish(size: 19, weight: .regular))
                            .foregroundColor(Color.eBlue)
                            .multilineTextAlignment(.center)
                    }
                    
                    if(image != nil) {
                        Image(image ?? "")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width * 0.13, height: geo.size.width * 0.13)
                    }
                    
                    if(imageURL != nil) {
                        KFImage(imageURL)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40) //TODO
                    }
                    
                    if(powerupImage != nil) {
                        KFImage(URL(string: powerupImage ?? ""))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width*0.6, height: geo.size.width*0.6)
                            .onLongPressGesture(perform: {
                                //TODO: Maybe share the image?
                            })
                    }
                    
                    if(confirmText != nil) {                        CustomButton(buttonText: confirmText ?? "", action: confirmAction)
                    }
                    
                    if(cancelText != nil) {
                        CustomButton(buttonText: cancelText ?? "", action: cancelAction)
                    }
                    
                }
                .frame(width: geo.size.width*widthPercentage)
                .padding()
                .border(LinearGradient.gold)
                .padding()
                .background(RoundedRectangle(cornerRadius: 5).fill(Color.eBlack))
                
                }
                .frame(width:geo.size.width,height: geo.size.height)
            }
    }
}

struct EnigmaAlert_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
        Color.egrey .blur(radius: 5).edgesIgnoringSafeArea(.all)
            EnigmaAlert(title: "THIS IS A TITLE", subtitle: "AND THIS IS SUBTITLE",showCloseButton:true, image: "Hint")
        }
    }
}
