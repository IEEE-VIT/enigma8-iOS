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
            
            if story.senderEnum != .narrator {
            CustomLabel(text:story.sender ?? "Name",font:.Cinzel(size: 14, weight: .bold),gradient: story.senderEnum.titleGradient)
                .padding(5)
            }
            
            Group {
                if story.senderEnum == .narrator {
                    Text(story.message ?? "Message")
                        .italic()
                } else {
                    Text(story.message ?? "Message")
                }
            }
                .foregroundColor(story.senderEnum.color)
                .font(story.senderEnum.font)
                .padding(8)
                .background(story.senderEnum.backgroundColor.opacity(story.senderEnum.backgroundOpacity))
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
