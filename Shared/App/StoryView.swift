//
//  StoryView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/4/21.
//

import SwiftUI

struct StoryView: View {
    @StateObject var storyVM: StoryViewModel
    // TODO: CREATE STORYVIEW ONCE HI-FI DESIGNS ARE READY
    var body: some View {
        Button(action: {
            storyVM.getStory()
        }, label: {
            Text("Click me first!")
        })
        Button(action: {
            storyVM.getFullStory()
        }, label: {
            Text("Click me second!")
        })
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(storyVM: StoryViewModel())
    }
}
