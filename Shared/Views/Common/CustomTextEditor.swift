//
//  CustomTextEditor.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import SwiftUI

struct CustomTextEditor: View {
    var textEditorEntry: Binding<String>
    var textEditorString: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: textEditorEntry)
            if textEditorEntry.wrappedValue.isEmpty {
                Text(textEditorString)
                    .foregroundColor(Color.gray)
                    .opacity(0.6)
                    .padding(.vertical,8)
                    .padding(.horizontal,8)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 0.2)
        )
        .padding(.horizontal, 20)
        Spacer(minLength: 20)
    }
}
