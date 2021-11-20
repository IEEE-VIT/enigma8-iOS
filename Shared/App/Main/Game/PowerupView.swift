//
//  PowerupView.swift
//  Enigma (iOS)
//
//  Created by Alok N on 05/11/21.
//

import SwiftUI
import PopupView

struct PowerupView: View {
    @StateObject var powerupVM: GameViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var rooms : RoomsViewModel
    
    var body: some View {
        GeometryReader { gr in
            NavigationLink(destination: CurrentStoryView(roomId: powerupVM.currentStatus?.room?._id ?? "").environmentObject(powerupVM).environmentObject(rooms), isActive: $powerupVM.navigateToRoom) {EmptyView()}
                        
            VStack(alignment: .center) {
                EnigmaHeader(showBackButton: true, showInstructionsButton: false,backAction: back)
                CustomLabel(text: "Choose a Powerup",font:.Cinzel(size: 26, weight: .bold))
                Text("*Chosen powerup can be used in this room only")
                    .font(.Mulish(size: 13, weight: .semibold))
                    .foregroundColor(.eGold)
                ScrollView(showsIndicators: false) {
                    VStack(spacing:gr.size.width * 0.04) {
                        ForEach(powerupVM.powerupList) { powerup in
                            Button(action: {powerupVM.choosePowerup(powerup: powerup)}) {
                                PowerupRow(powerup: powerup, width: gr.size.width)
                            }
                        }
                    }
                }
            }
            .padding(.bottom,20)
            .popup(isPresented: $powerupVM.showAlert, animation: Animation.spring()) {
                EnigmaAlert(title: "Are you sure you want to use this powerup?",text: "This powerup can only be used in this room. It cannot be changed later.", confirmText: "Confirm", showCloseButton: true, confirmAction: { powerupVM.selectPowerup(powerup: powerupVM.chosenPowerup ?? Powerup.PowerupModel())}, closeAction: {powerupVM.showAlert = false}, imageURL: powerupVM.chosenPowerup?.iconURL)
            }
        }
        .background(Color.eBlack.edgesIgnoringSafeArea(.bottom))
        .onAppear(perform: powerupVM.getPowerups)
        .navigationBarHidden(true)
        .onChange(of: rooms.navigateToPowerups) { value in
            if !value {
                self.back()
            }
        }
    }
    
    func back() {
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct PowerupView_Previews: PreviewProvider {
    static var previews: some View {
        PowerupView(powerupVM: GameViewModel(currentStatus: RoomsModel()))
    }
}
