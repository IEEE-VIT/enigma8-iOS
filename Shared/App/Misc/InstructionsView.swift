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
    @ObservedObject var instructionsVM: InstructionsVM = InstructionsVM()
    var body: some View {
        VStack(spacing: 0) {
            EnigmaHeader(showBackButton: instructionsShown, hideHeaderIcons: !instructionsShown, showInstructionsButton: false,backAction: back)
            InstructionsCommonHeader().padding()
            InstructionsHeader(viewName: AppConstants.instructionsScreens[selectedTab], selectedTab: $selectedTab)
            TabView(selection: $selectedTab) {
                GameMechanics(data: instructionsVM.instructions?.gameMechanics ?? AppConstants.instructionsGameMechanics).tag(0)
                ScoringSystem(data: instructionsVM.instructions?.scoringSystem ?? AppConstants.instructionsScoringSystem).tag(1)
                Powerups(data: instructionsVM.instructions?.powerUps ?? AppConstants.instructionsPowerups).tag(2)
                RoomStates(data: instructionsVM.instructions?.roomStates ?? AppConstants.instructionsRoomStates).tag(3)
                LetsPlay(data: instructionsVM.instructions?.miscellaneous ?? AppConstants.instructionsLetsPlay).tag(4)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .onAppear(perform: instructionsVM.fetchInstructions)
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



class InstructionsVM: ObservableObject {
  @Published var instructions: InstructionsModel?
    
    init() { }
    
    func fetchInstructions() {
        APIClient.request(fromRouter: .instructions) { (response:InstructionsModel?, error) in
            guard let response = response else {
                return
            }
            self.instructions = response
        }
    }
}
