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
    @AppStorage(AppStorageConstants.enigmaStarted) var enigmaStarted: Bool = false
    @AppStorage(AppStorageConstants.instructionsShown) var instructionsShown: Bool = false
    @StateObject var timerVM: TimerViewModel = TimerViewModel()
    @StateObject var headerVM: HeaderRules = HeaderRules()
    @StateObject var authVM: AuthViewModel = AuthViewModel()
    var body: some View {
            if(onboarded) {
                if(userLoggedIn) {
                    if(enigmaStarted) {
                        if(instructionsShown) {
                            HeaderNavView()
                                .navigationTitle("")
                                .navigationBarHidden(true)
                                .environmentObject(headerVM)
                        } else {
                            InstructionsView()
                                .environmentObject(headerVM)
                        }
                    } else {
                        NavigationView {
                        TimeView()
                            .environmentObject(timerVM)
                        }
                    }
                } else {
                    NavigationView {
                    LoginView(authVM: authVM, googleVM: GoogleCoordinator(authVM: authVM), appleVM: AppleCoordinator(authVM: authVM))
                            .navigationTitle("")
                            .navigationBarHidden(true)
                            .ignoresSafeArea()
                    }
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
