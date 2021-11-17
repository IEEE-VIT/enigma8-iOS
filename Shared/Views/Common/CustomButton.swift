//
//  CustomButton.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/5/21.
//

import SwiftUI

struct CustomButton: View {
    var buttonText: String = "Submit"
    var borderColor: Color = Color.clear
    var action: () -> Void = {}
    var fgroundColor: Color = Color.black
    var bgroundColor: Color = Color.eBlue
    var font: Font = .Mulish(size: 14, weight: .semibold)
    var cornerRad: CGFloat = 4
    var body: some View {
        HStack(spacing: 0) {
            Spacer(minLength: 100)
            Button(action: action){
                Text(buttonText)
                    .lineLimit(1)
                    .minimumScaleFactor(0.3)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 5)
                    .foregroundColor(fgroundColor)
                    .background(bgroundColor)
                    .border(borderColor, width: 2.0)
                    .font(font)
                    .cornerRadius(cornerRad)
                Spacer(minLength: 100)
            }
        }
    }
}

struct SocialButton: View {
    var action: () -> Void = {}
    var image: SignupType
    var body: some View {
        Button(action: action){
            Image(image.rawValue)
                .resizable()
                .scaledToFit()
        }
    }
}

struct CustomGradientButton: View {
    var buttonText: String = "Submit"
    var action: () -> Void = {}
    var font: Font = .Mulish(size: 14, weight: .semibold)
    var body: some View {
        HStack(spacing: 0) {
            Spacer(minLength: 100)
            Button(action: action){
                CustomLabel(text: buttonText)
                    .lineLimit(1)
                    .minimumScaleFactor(0.3)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .font(font)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(LinearGradient.gold, lineWidth: 1))
                    
                Spacer(minLength: 100)
            }
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton()
            .previewLayout(.sizeThatFits)
    }
}
