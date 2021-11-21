//
//  RoomStatesTorches.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/18/21.
//

import SwiftUI

struct RoomStatesTorches: View {
    var name: String
    var body: some View {
        HStack {
            Image(name)
                .resizable()
                .scaledToFit()
                .frame(height: 44)
            Text("Question \(name.capitalized)")
                .font(.Mulish(size: 14, weight: .semibold))
                .foregroundColor(Color.eBlue)
        }
    }
}

struct RoomStatesTorches_Previews: PreviewProvider {
    static var previews: some View {
        RoomStatesTorches(name: "locked")
    }
}
