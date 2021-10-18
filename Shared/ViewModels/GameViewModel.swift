//
//  GameViewModel.swift
//  Enigma (iOS)
//
//  Created by Alok N on 16/10/21.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var currentStatus: CurrentStatus = CurrentStatus()
}

struct CurrentStatus {
    var roomNo: Int = 1
    var question: Question = Question()
    var chosenPowerup: String = "Blast"
    var isPowerupUsed: Bool = false
}

struct Question {
    let questionNo: Int = 1
    let question: String = "This is a lorem ipsum question This is a lorem ipsum questionThis is a lorem ipsum question This is a lorem ipsum question This is a lorem ipsum question This is a lorem ipsum question This is a lorem ipsum question This is a lorem ipsum question"
    let mediaURL: URL = URL(string: "https://pbs.twimg.com/media/EoS2HGIU4AArhRT.jpg:large")!
    //var mediaURL = URL(string: "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_1280_10MG.mp4")
    let mediaType: QMediaType = .image
}

enum QMediaType {
    case image, video
}
