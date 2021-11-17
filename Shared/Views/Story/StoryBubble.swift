//
//  StoryBubble.swift
//  Enigma (iOS)
//
//  Created by Alok N on 10/10/21.
//

import SwiftUI
import Kingfisher

struct StoryBubble: View {
    
    var story: Story
    var width: CGFloat
    var body: some View {
        VStack (alignment:story.senderEnum.titleAlignment,spacing: 0) {
            
            CustomLabel(text:story.sender ?? "Name",font:.Cinzel(size: 14, weight: .bold))
                .padding(5)
            
            Text(story.message ?? "Message")
                .foregroundColor(story.senderEnum.color)
                .font(.Mulish(size: 15, weight: .semibold))
                .padding(8)
                .background(Color.storyGrey)
                .cornerRadius(6)
        }
        .frame(maxWidth: .infinity,alignment: story.senderEnum.bubbleAlignment)
        .padding(.leading, width * story.senderEnum.leadingAchor)
        .padding(.trailing, width * story.senderEnum.trailingAchor)
        .padding(.vertical)
    }
}

struct StoryBubble_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StoryBubble(story: Story.storySample, width: 360)
            StoryBubble(story: Story.storyMJ, width: 360)
        }
        .frame(width: 360)
        .previewLayout(.sizeThatFits)
        .background(Color.black)
    }
}
