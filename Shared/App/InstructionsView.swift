//
//  InstructionsView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import SwiftUI

struct InstructionsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var headerVM: HeaderRules
    @State var selectedTab = 0

    var body: some View {
        VStack(spacing: 0) {
            EnigmaHeader(showBackButton: true, showInstructionsButton: false)
            InstructionsCommonHeader()
            InstructionsHeader(viewName: AppConstants.instructionsScreens[selectedTab], selectedTab: $selectedTab)
            TabView(selection: $selectedTab) {
                GameMechanics()
                    .tag(0)
                ScoringSystem()
                    .tag(1)
                Powerups()
                    .tag(2)
                RoomStates()
                    .tag(3)
                LetsPlay()
                    .tag(4)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
        .padding()
        .background(Image("InstructionsBG").resizable().scaledToFill().edgesIgnoringSafeArea(.all))
        .background(Color.black)
       // .edgesIgnoringSafeArea(.all)
        .onChange(of: headerVM.showInstructions) { dismiss in
            if !dismiss {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView()
    }
}


