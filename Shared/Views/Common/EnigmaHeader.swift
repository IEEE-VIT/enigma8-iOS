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
            NavigationLink(destination: Text("You're at Notifs")){
                Image(systemName: "bell.badge.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
            }.foregroundColor(.black)
            Spacer()
            Text("ENIGMA")
                .font(.system(size: 25))
            Spacer()
            NavigationLink(destination: Text("You're at Instructions")){
                Image(systemName: "info.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
            }.foregroundColor(.black)
        }.padding()
         .background(Color(white: 0, opacity: 0.1))
    }
}

struct EnigmaHeader_Previews: PreviewProvider {
    static var previews: some View {
        EnigmaHeader()
    }
}
