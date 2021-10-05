//
//  LoginView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/5/21.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("ENIGMA")
                .font(.title)
            Spacer()
            CustomButton()
                .padding(.horizontal,40)
            CustomButton(buttonText:"Sign up with Apple")
                .padding(.horizontal,40)
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
