//
//  PowerupView.swift
//  Enigma (iOS)
//
//  Created by Alok N on 05/11/21.
//

import SwiftUI

struct PowerupView: View {
    @StateObject var powerupVM: GameViewModel = GameViewModel()
    
    var body: some View {
            VStack(alignment: .leading) {
                Text("Choose a Powerup")
                    .bold()
                    .font(.title)
                Text("*Chosen powerup can be used in this room only")
                    .font(.system(size: 12))
                ForEach(powerupVM.powerupList) { powerup in
                    if(powerup.available ?? true) {
                        Button(action: { powerupVM.selectPowerup(powerup: powerup) }) {
                            PowerupRow(powerup: powerup)
                       }.foregroundColor(.black)
                    }
                }
            }
            .onAppear(perform: powerupVM.getPowerups)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 3))
            .padding(.horizontal)
    }
}

struct PowerupView_Previews: PreviewProvider {
    static var previews: some View {
        PowerupView()
    }
}
