//
//  TimerBlock.swift
//  Enigma (iOS)
//
//  Created by Alok N on 05/10/21.
//

import SwiftUI

struct TimerBlockView: View {
    var value: Int
    
    var body: some View {
        Text("\(value)")
            .padding()
    }
}

struct TimerBlockView_Previews: PreviewProvider {
    static var previews: some View {
        TimerBlockView(value: 10)
    }
}
