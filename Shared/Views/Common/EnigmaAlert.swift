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
    var confirmAction: () -> Void = {}
    var cancelAction: () -> Void = {}
    var closeAction: () -> Void = {print("Clicked Close")}
    var image: String? //= "Key"
    var imageURL: URL?
    var widthPercentage = 0.7
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack(spacing: 20) {
                    if(title != nil) {
                        Text(title ?? "")
                            .font(.Mulish(weight: .bold))
                            .foregroundColor(Color.eSecondaryBlue)
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
                            .font(.Mulish(size: 15, weight: .regular))
                            .foregroundColor(Color.eBlue)
                            .multilineTextAlignment(.center)
                    }
                    if(image != nil) {
                        Image(image ?? "")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                    }
                    if(imageURL != nil) {
                        KFImage(imageURL)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                    }
                    if(confirmText != nil) {
                        CustomButton(buttonText: confirmText ?? "", action: confirmAction, bgroundColor: Color.white, font: .system(size: 15, weight: .medium))
                    }
                    if(cancelText != nil) {
                        CustomButton(buttonText: cancelText ?? "", action: cancelAction, bgroundColor: Color.white, font: .system(size: 15, weight: .medium))
                    }
                }
                .frame(width: geo.size.width*widthPercentage,alignment: .top)
                .padding()
                .overlay(LinearGradient(colors: [.goldGradientStart, .goldGradientEnd], startPoint: .top, endPoint: .bottom).mask(Rectangle()
                            .stroke(lineWidth: 2)))
                .padding()
                .background(RoundedRectangle(cornerRadius: 5)
                                .fill(Color.eBlack))
                .frame(height: geo.size.height,alignment: .top)
                if(showCloseButton) {
                    Button(action: closeAction) {
                        Image("closeButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                    }.frame(width: geo.size.width*(widthPercentage+0.2), height: geo.size.height+20, alignment: .topTrailing)
                }
            }.frame(width: geo.size.width, alignment: .top)
        }.frame(minHeight: UIScreen.main.bounds.height/2.5, maxHeight: UIScreen.main.bounds.height/2, alignment: .top)
    }
}

struct EnigmaAlert_Previews: PreviewProvider {
    static var previews: some View {
        EnigmaAlert()
    }
}
