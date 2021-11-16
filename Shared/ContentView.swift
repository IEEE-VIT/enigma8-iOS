//
//  ContentView.swift
//  Shared
//
//  Created by Aaryan Kothari on 07/09/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onBoardShown") var onBoardShown: Bool = false
    @AppStorage("userLoggedIn") var userLoggedIn: Bool = false
    var body: some View {
        NavigationView {
            if(onBoardShown) {
                if(userLoggedIn) {
                    HeaderNavView()
                        .navigationTitle("")
                        .navigationBarHidden(true)
                } else {
                    LoginView(authVM: AuthViewModel())
                            .navigationTitle("")
                            .navigationBarHidden(true)
                            .ignoresSafeArea()
                }
            } else {
                Onboarding()
                    .navigationTitle("")
                    .navigationBarHidden(true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
