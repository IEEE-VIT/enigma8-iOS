//
//  RoomQuestionStatusView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/8/21.
//

import SwiftUI

struct RoomQuestionStatusView: View {
    var questionStatus: [questionStatus?]
    var body: some View {
        HStack {
            ForEach(0..<questionStatus.count) { i in
                Image(systemName: "circle.fill")
                    .foregroundColor(questionStatus[i]?.color)
            }
        }
    }
}

struct RoomQuestionStatusView_Previews: PreviewProvider {
    static var previews: some View {
        RoomQuestionStatusView(questionStatus: [.locked,.unlocked,.solved])
    }
}
