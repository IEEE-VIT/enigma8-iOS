//
//  CustomTextField.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/14/21.
//

import SwiftUI

struct CustomTextField: View {
    var textFieldString: String
    var bindingString: Binding<String>
    var body: some View {
       TextField(textFieldString, text: bindingString)
            .textFieldStyle(RoundedBorderTextFieldStyle())
//            .padding(.top)
        
    }
}
