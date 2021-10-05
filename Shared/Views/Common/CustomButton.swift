//
//  CustomButton.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/5/21.
//

import SwiftUI

struct CustomButton: View {
    var buttonText: String = "Sign up with Google"
    var borderColor: Color = Color.white
    var action: () -> Void = {}
    var fgroundColor: Color = Color.black
    var bgroundColor: Color = Color.gray
    var font: Font = .body
    var cornerRad: CGFloat = 10.0
    var body: some View {
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
                    
            }
        }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton()
    }
}
