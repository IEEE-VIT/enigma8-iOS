//
//  TimerBlock.swift
//  Enigma (iOS)
//
//  Created by Alok N on 05/10/21.
//

import SwiftUI

struct TimerBlock: View {
    var value: Int
    var width: CGFloat
    var title: String
    var hideBottom: Bool = false
    var body: some View {
        VStack(alignment: .center,spacing:16) {
            HStack(spacing:width * 0.1) {
                TimerCell(value: Int(value/10))
                TimerCell(value: value%10)
        }
        .frame(width: width)
            
            if !hideBottom {
            CustomLabel(text: title,font:.Mulish(size: 18, weight: .regular))
            }
        }
    }
}

struct TimerCell: View {
    var value: Int
    var body: some View {
        ZStack{
        RoundedRectangle(cornerRadius: 3)
                .stroke(Color.eBlue, lineWidth: 1)
                .shadow(color: Color.eBlue, radius: 0.5, x:1, y: 1)
                .aspectRatio(1, contentMode: .fit)
        Color.eBlack.cornerRadius(3)
                .aspectRatio(1, contentMode: .fit)
        CustomLabel(text: "\(value)",font:.Cinzel(size: 24, weight: .bold))
                .minimumScaleFactor(0.5)
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

struct TimerBlockView_Previews: PreviewProvider {
    static var previews: some View {
        TimerBlock(value:3,width: 100, title: "Days")
            .previewLayout(.sizeThatFits)
    }
}
