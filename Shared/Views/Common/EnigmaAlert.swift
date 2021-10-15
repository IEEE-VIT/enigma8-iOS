//
//  EnigmaAlert.swift
//  Enigma (iOS)
//
//  Created by Alok N on 15/10/21.
//

import SwiftUI

struct EnigmaAlert: View {
    var text: String = "This powerup can only be used once in this room. Are you sure you want to use the XYZ powerup for this question?"
    var confirmText: String = "Confirm"
    var cancelText: String = "Cancel"
    var confirmAction: () -> Void = {}
    var cancelAction: () -> Void = {}
    var image: some View = Image(systemName: "xmark.circle").resizable().frame(width: 40, height: 40)
    
    var body: some View {
        VStack(spacing: 20) {
            Text(text)
                .font(.system(size:20))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            image
            HStack {
                Spacer(minLength: 30)
                CustomButton(buttonText: confirmText, action: confirmAction, bgroundColor: Color.white, font: .system(size: 15, weight: .medium))
                Spacer(minLength: 30)
                CustomButton(buttonText: cancelText, action: cancelAction, bgroundColor: Color.white, font: .system(size: 15, weight: .medium))
                Spacer(minLength: 30)
            }
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.primary, lineWidth: 2))
        .background(RoundedRectangle(cornerRadius: 20)
                        .fill(Color(white: 0, opacity: 0.2)))
    }
}

struct EnigmaAlert_Previews: PreviewProvider {
    static var previews: some View {
        EnigmaAlert()
    }
}
