//
//  PowerupView.swift
//  Enigma (iOS)
//
//  Created by Alok N on 05/11/21.
//

import SwiftUI

struct PowerupView: View {
    @StateObject var powerupVM: GameViewModel = GameViewModel(currentStatus: RoomsModel())
    @State var chosenPowerup: Powerup.PowerupModel?
    @State var showAlert = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                NavigationLink(destination: RoomUI(gameVM: powerupVM), isActive: $powerupVM.navigateToRoom) {EmptyView()}
                VStack(alignment: .leading) {
                    Text("Choose a Powerup")
                        .bold()
                        .font(.title)
                    Text("*Chosen powerup can be used in this room only")
                        .font(.system(size: 12))
                    ScrollView {
                        ForEach(powerupVM.powerupList.sorted{ ($0.available ?? false) && !($1.available ?? false) }) { powerup in
                                Button(action: { chosenPowerup = powerup; showAlert = true }) {
                                    PowerupRow(powerup: powerup)
                               }.foregroundColor(.black)
                        }
                    }
                }.padding()
                .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 3))
                .padding(.horizontal)
                .frame(height: geo.size.height*0.8, alignment: .center)
                if(showAlert) {
                    EnigmaAlert(text: "Are you sure you want to use \(chosenPowerup?.name ?? "this") powerup?", confirmAction: { powerupVM.selectPowerup(powerup: chosenPowerup ?? Powerup.PowerupModel())}, cancelAction: {showAlert = false})
                }
            }.frame(width: geo.size.width, height: geo.size.height)
        }
        .onAppear(perform: powerupVM.getPowerups)
        .navigationBarHidden(true)
    }
}

struct PowerupView_Previews: PreviewProvider {
    static var previews: some View {
        PowerupView()
    }
}
