//
//  EnigmaHeader.swift
//  Enigma (iOS)
//
//  Created by Alok N on 15/10/21.
//

import SwiftUI

struct EnigmaHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "message")
                .resizable()
                .frame(width: 25, height: 25)
            Spacer()
            Text("ENIGMA")
                .font(.system(size: 25))
            Spacer()
            Image(systemName: "info.circle")
                .resizable()
                .frame(width: 25, height: 25)
        }.padding()
            .background(Color(white: 0, opacity: 0.1))
    }
}

struct EnigmaHeader_Previews: PreviewProvider {
    static var previews: some View {
        EnigmaHeader()
    }
}
