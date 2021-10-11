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
    var bgColor: Color = Color(white: 0, opacity: 0.2)
    var maxSizeP = 0.8
    var body: some View {
        GeometryReader { reader in
            HStack(alignment: .top) {
                KFImage(story.iconURL)
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                VStack (alignment: .leading, spacing: 10) {
                    Text(story.sender ?? "Name")
                        .font(.system(size: 20))
                    Text(story.message ?? "Message")
                }
            }.padding(10)
            .background(bgColor)
            .frame(maxWidth: reader.size.width * maxSizeP,  minHeight: 60, maxHeight: reader.size.height * maxSizeP)
        }
    }
}

struct StoryBubble_Previews: PreviewProvider {
    static var previews: some View {
        StoryBubble(story: Story.storySample, bgColor: Color(white: 0, opacity: 0.2) )
    }
}
