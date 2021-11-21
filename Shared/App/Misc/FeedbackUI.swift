//
//  FeedbackUI.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import SwiftUI

struct FeedbackUI: View {
    
    @ObservedObject var feedbackVM: FeedbackViewModel = FeedbackViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack(alignment:.leading) {
            EnigmaHeader(showBackButton: true,showInstructionsButton: false, backAction: back)
            
            VStack(alignment:.leading,spacing:0) {
            CustomLabel(text: "Feedback Form",font: .Cinzel(size: 26, weight: .bold))
            
            CustomLabel(text: "Your feedback makes us better!",gradient: .blue)
            }.padding(.leading,25)
            ScrollView(showsIndicators: false) {
            VStack(alignment:.leading,spacing:23) {
                
                RadioButtonGroup(titleText: feedbackVM.isVITStudentTitle, options: feedbackVM.isVITStudentOptions, selected: $feedbackVM.isVITStudent)
                
                if (feedbackVM.isVITStudent == 0) {
                FeedbackQuestionAnswerBlock(questionText: feedbackVM.regNoTitle, textFieldString: "", textfieldEntry: $feedbackVM.regNo)
                
                FeedbackQuestionAnswerBlock(questionText: feedbackVM.vitEmailTitle, textFieldString: "", textfieldEntry: $feedbackVM.vitEmail)
                }
                RadioButtonGroup(titleText: feedbackVM.gameRatingTitle, options: feedbackVM.gameRatingOptions, selected: $feedbackVM.gameRating)
                
                FeedbackQuestionAnswerBlock(questionText: feedbackVM.userExperienceTitle, textFieldString: "", textfieldEntry: $feedbackVM.userExperience)
                
                FeedbackQuestionAnswerBlock(questionText: feedbackVM.featureIdeasTitle, textFieldString: "", textfieldEntry: $feedbackVM.featureIdeas)
                
                CustomButton(buttonText: "Submit", action: self.publishFeedback)
                    .padding(25)
                    .disabled(!feedbackVM.enabled)
                    .opacity(!feedbackVM.enabled ? 0.7 : 1)

                Spacer()
            }
            .padding(25)
            }
        }
        .background(NotificationBackground().edgesIgnoringSafeArea(.bottom))
        .navigationTitle("")
        .navigationBarHidden(true)
    }
    
    
    func back() {
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func publishFeedback() {
        let isVitian: Bool = feedbackVM.isVITStudent == 0
        let regNo: String? = isVitian ? feedbackVM.regNo : nil
        let vitEmail: String? = isVitian ? feedbackVM.vitEmail : nil
        
        let request = FeedbackModel(isVITStudent: isVitian, regNo: regNo, vitEmail: vitEmail, gameRating: feedbackVM.gameRating + 1, userExperience: feedbackVM.userExperience, featureIdeas: feedbackVM.featureIdeas)
        APIClient.request(fromRouter: .postFeedback(request)) { (response:EmptyModel?, error) in
            if let error = error {
                Logger.error(error)
            }
            UserDefaults.standard.set(true, forKey: AppStorageConstants.feedbackFilled)
            self.back()
        }
    }
}

struct FeedbackUI_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackUI()
    }
}

class FeedbackViewModel: ObservableObject {
    @Published var isVITStudent: Int = 2
    @Published var regNo: String = ""
    @Published var vitEmail: String = ""
    @Published var gameRating: Int = 5
    @Published var userExperience: String = ""
    @Published var featureIdeas: String = ""
    
    let isVITStudentOptions = ["YES","NO"]
    let gameRatingOptions = ["1","2","3","4","5"]
    
    var enabled: Bool {
        let isVitianFilled = (isVITStudent < 2)
        
        let isVitian = (isVITStudent == 0)

        let gameFilled = (gameRating < 5)
        let userFilled = userExperience.count > 1
        let featureFilled = featureIdeas.count > 1
        let regNoFilled = isVitian && regNo.count > 6
        let vitEmail = isVitian && vitEmail.count > 11

        return (isVitianFilled && gameFilled && userFilled && featureFilled)
        
        // TODO add remaining validation
    }
    
    let isVITStudentTitle = "Q1. Are you a VIT student?"
    let regNoTitle = "Enter your registration number"
    let vitEmailTitle = "Enter your VIT email id"
    let gameRatingTitle = "Q2. On a scale of 1-5, how would you rate the game?"
    let userExperienceTitle = "Q3. How was your user experience during the game?"
    let featureIdeasTitle = "Q4. Anything you would like to add for the upcoming enigma?"

}

class EmptyModel: Codable {
    
}
