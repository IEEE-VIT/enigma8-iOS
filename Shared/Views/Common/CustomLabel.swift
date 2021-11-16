//
//  CustomLabel.swift
//  Enigma (iOS)
//
//  Created by Aaryan Kothari on 16/11/21.
//

import SwiftUI

struct CustomLabel: View {
    var text: String
    var font : Font = .Mulish(size: 15, weight: .bold)
    let gradient = LinearGradient(gradient: Gradient(colors: [.goldGradientStart, .goldGradientEnd]), startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        
        Text(text)
                .font(font)
                .foregroundColor(Color.clear)
                .background(gradient.mask(Text(text)).font(font))
    }
}

struct CustomLabel_Previews: PreviewProvider {
    static var previews: some View {
        CustomLabel(text: "Hello World!")
            .previewLayout(.sizeThatFits)
    }
}
