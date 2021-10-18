//
//  FeedbackQuestionAnswerBlock.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import SwiftUI

struct FeedbackQuestionAnswerBlock: View {
    var questionText: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit?"
    var textFieldString: String = "Answer Field"
    var textfieldEntry: Binding<String>
    var body: some View {
        Text(questionText)
        CustomTextField(textFieldString: textFieldString, bindingString: textfieldEntry)
            .padding(.horizontal, 20)
    }
}

