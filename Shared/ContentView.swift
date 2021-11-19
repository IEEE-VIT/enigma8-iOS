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
    @AppStorage(AppStorageConstants.enigmaStarted) var enigmaStarted: Bool = true /// TODO: false
    @AppStorage(AppStorageConstants.instructionsShown) var instructionsShown: Bool = false
    @StateObject var roomsVM: RoomsViewModel = RoomsViewModel()
    @StateObject var timerVM: TimerViewModel = TimerViewModel()
    @StateObject var headerVM: HeaderRules = HeaderRules()

    var body: some View {
            if(onboarded) {
                if(userLoggedIn) {
                    if(enigmaStarted) {
                        if(instructionsShown) {
                            HeaderNavView()
                                .navigationTitle("")
                                .navigationBarHidden(true)
                                .environmentObject(roomsVM)
                                .environmentObject(headerVM)
                        } else {
                            InstructionsView()
                                .environmentObject(headerVM)
                        }
                    } else {
                        TimeView()
                            .navigationTitle("")
                            .navigationBarHidden(true)
                            .environmentObject(timerVM)
                    }
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
