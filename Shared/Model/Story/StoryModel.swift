//
//  StoryModel.swift
//  Enigma (iOS)
//
//  Created by Alok N on 10/10/21.
//

import Foundation
import SwiftUI

struct Story:Codable {
    var sender: String?
    var message: String?
    var icon: String?
    var index: Int?

    var iconURL: URL? {
        return URL(string: icon ?? "")
    }
    
    static let storySample: Story = Story(sender: "John AppleSeed", message: "Lorem Ipsum Dolor Sit amet Lorem Ipsum Dolor Sit amet Lorem Ipsum Dolor Sit amet Lorem Ipsum Dolor Sit amet Lorem Ipsum Dolor Sit amet Lorem Ipsum Dolor Sit amet", icon: "https://upload.wikimedia.org/wikipedia/commons/f/fc/Johnny_Appleseed_photograph.jpg", index: 0)
    
}
