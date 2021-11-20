//
//  InstructionsView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import SwiftUI

struct InstructionsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @AppStorage(AppStorageConstants.instructionsShown) var instructionsShown: Bool = false
    @State var selectedTab = 0

    var body: some View {
        VStack(spacing: 0) {
            EnigmaHeader(showBackButton: instructionsShown, hideHeaderIcons: !instructionsShown, showInstructionsButton: false,backAction: back)
            InstructionsCommonHeader().padding()
            InstructionsHeader(viewName: AppConstants.instructionsScreens[selectedTab], selectedTab: $selectedTab)
            TabView(selection: $selectedTab) {
                GameMechanics().tag(0)
                ScoringSystem().tag(1)
                Powerups().tag(2)
                RoomStates().tag(3)
                LetsPlay().tag(4)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .background(Image("InstructionsBG").resizable().scaledToFill().edgesIgnoringSafeArea(.bottom))
        .background(Color.black)
        .animation(.default)
    }
    
    func back() {
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView()
    }
}


