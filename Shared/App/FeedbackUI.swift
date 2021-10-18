//
//  FeedbackUI.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import SwiftUI

struct FeedbackUI: View {
    var sampleText: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit?"
    @State var textfield1: String = ""
    @State var textfield2: String = ""
    @State var textfield3: String = ""
    var body: some View {
        VStack {
            // TODO: remove Text and make "Feedback Form" the navBarTitle
            Text("Feedback Form")
                .font(.largeTitle)
            Spacer(minLength: 20)
            FeedbackQuestionAnswerBlock(questionText: sampleText, textFieldString: "Answer Field", textfieldEntry: $textfield1)
            FeedbackQuestionAnswerBlock(questionText: sampleText, textFieldString: "Answer Field", textfieldEntry: $textfield2)
            Text(sampleText)
            CustomTextEditor(textEditorEntry: $textfield3, textEditorString: "Answer Field")
            Spacer(minLength: 20)
            // TODO: Wrap HStack in NavigationLink
            HStack {
                Spacer(minLength: 100)
                CustomButton(buttonText: "Next")
                Spacer(minLength: 100)
            }
            Spacer()
        }
    }
}

struct FeedbackUI_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackUI()
    }
}
