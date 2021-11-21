//
//  CustomTextField.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/14/21.
//

import SwiftUI

struct CustomTextField: View {
    var textFieldString: String
    @Binding var bindingString: String
    
    var body: some View {
       TextField(textFieldString, text: $bindingString)
            .padding()
            .accentColor(.eGold)
            .autocapitalization(.none)
            .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(LinearGradient.gold,style: StrokeStyle(lineWidth: 2.0)))
                        .foregroundColor(.white)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(textFieldString: "Enter UserName", bindingString: .constant(""))
            .previewLayout(.sizeThatFits)
            .background(OnboardingBackground())
    }
}
