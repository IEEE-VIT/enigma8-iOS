//
//  PowerupView.swift
//  Enigma (iOS)
//
//  Created by Alok N on 05/11/21.
//

import SwiftUI
import PopupView

struct PowerupView: View {
    @StateObject var powerupVM: GameViewModel = GameViewModel(currentStatus: RoomsModel())
    
    var body: some View {
        GeometryReader { gr in
            NavigationLink(destination: RoomUI(gameVM: powerupVM), isActive: $powerupVM.navigateToRoom) {EmptyView()}
            
            VStack(alignment: .center) {
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
            .padding(.vertical,20)
            //            .popup(isPresented: $showAlert, animation: Animation.spring()) {
            //                    EnigmaAlert(text: "Are you sure you want to use \(chosenPowerup?.name ?? "this") powerup?", confirmAction: { powerupVM.selectPowerup(powerup: chosenPowerup ?? Powerup.PowerupModel())}, cancelAction: {showAlert = false})
            //            }
        }
        .background(Color.eBlack)
        .onAppear(perform: powerupVM.getPowerups)
        .navigationBarHidden(true)
    }
}

struct PowerupView_Previews: PreviewProvider {
    static var previews: some View {
        PowerupView()
    }
}
