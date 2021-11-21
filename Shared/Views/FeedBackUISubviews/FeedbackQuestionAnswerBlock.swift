//
//  FeedbackQuestionAnswerBlock.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import SwiftUI

struct FeedbackQuestionAnswerBlock: View {
    var questionText: String
    var textFieldString: String = ""
    @Binding var textfieldEntry: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
        Text(questionText)
            .font(.Mulish(size: 16, weight: .regular))
            .foregroundColor(.eGold)
            CustomTextField(textFieldString: "", bindingString: $textfieldEntry)
    }
    }
}

