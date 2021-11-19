//
//  ContentView.swift
//  Shared
//
//  Created by Aaryan Kothari on 07/09/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage(AppStorageConstants.onboarding) var onboarded: Bool = false
    @AppStorage(AppStorageConstants.login) var userLoggedIn: Bool = false
    @StateObject var roomsVM: RoomsViewModel = RoomsViewModel()
    
    var body: some View {
            if(onboarded) {
                if(userLoggedIn) {
                    HeaderNavView()
                        .preferredColorScheme(.dark)
                        .navigationTitle("")
                        .navigationBarHidden(true)
                        .environmentObject(roomsVM)
                        .background(Color.black.edgesIgnoringSafeArea(.all))
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
