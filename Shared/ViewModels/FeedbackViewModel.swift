//
//  FeedbackViewModel.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/4/21.
//

import Foundation

class FeedbackViewModel: ObservableObject {
    
    @Published var text1: String = ""
    @Published var text2: String = ""
    @Published var text3: String = ""
    @Published var feedbackSent: Bool = false
    
    func submitFeedBack(){
        let request = FeedbackModel.Request(text: "\(text1), \(text2), \(text3)")
        APIClient.request(fromRouter: .feedback(request)){ (response: FeedbackModel.Response?,error) in
            if let error = error {
                self.feedbackSent = false
                Logger.error(error.debugDescription)
                return
            }
            Logger.info(response ?? "")
            self.feedbackSent = true
        }
    }
}
