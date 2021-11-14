//
//  GameViewModel.swift
//  Enigma (iOS)
//
//  Created by Alok N on 16/10/21.
//

import Foundation

class GameViewModel: ObservableObject {
    var currentStatus: RoomsModel?
    @Published var powerupList: [Powerup.PowerupModel] = []
    @Published var currentQuestion: Question.Response?
    @Published var navigateToRoom: Bool = false
    @Published var fetchedHint: String = ""
    @Published var answerText: String = ""
    @Published var answerStatus: AnswerStatus = .none
    @Published var hintFetched: Bool = false
    @Published var showPopup: Bool = false
    @Published var navigateToPowerup: Bool = false
    @Published var navigateBackToRooms: Bool = false
    
    init(currentStatus: RoomsModel) {
        self.currentStatus = currentStatus
    }
    
    func getPowerups() {
        APIClient.request(fromRouter: Router.getPowerup) { (response: Powerup.Response?, error) in
            guard let response = response else {return}
            self.powerupList = response.powerups!
        }
    }
    
    func selectPowerup(powerup: Powerup.PowerupModel) -> Void {
        APIClient.request(fromRouter: Router.selectPowerup(Powerup.SelectRequest(roomId: currentStatus?.room?._id, powerupId: powerup.id))) { (response: Powerup.SelectResponse?, error) in
            guard let response = response else {return}
            if(error == nil) {//Success in Selecting Powerup
                self.currentStatus?.room = response.room
                self.navigateToRoom = true
                print("Navigating to Room")
            }
        }
    }
    
    func getQuestion() {
        APIClient.request(fromRouter: Router.getQuestion(Question.Request(roomId: currentStatus?.room?._id ?? ""))) { (response: Question.Response?, error) in
            if error != nil {//Any Error occurs, go back to allRooms
                self.navigateBackToRooms = true
            }
            guard let response = response else {return}
            //Reset Everything
            self.hintFetched = false
            self.answerStatus = .none
            self.answerText = ""
            self.currentQuestion = response
        }
    }
    
    func getHint() {
        APIClient.request(fromRouter: Router.getHint(Hint.Request(roomId: currentStatus?.room?._id ?? ""))) {
            (response: Hint.Response?, error) in
            guard let response = response else {return}
            self.hintFetched = true
            self.fetchedHint = response.hint ?? "Something went wrong"
        }
    }
    
    func submitAnswer() {
        APIClient.request(fromRouter: Router.submitAnswer(Answer.Request(roomId: currentStatus?.room?._id ?? "", userAnswer: answerText))) {
            (response: Answer.Response?, error) in
            guard let response = response else {return}
            if response.correctAnswer ?? false {
                self.answerStatus = .correct
                if response.nextRoomUnlocked ?? false {
                    self.answerStatus = .nextRoom
                }
                self.showPopup = true
            } else {
                if response.closeAnswer ?? false {
                    self.showPopup = true
                    self.answerStatus = .close
                } else {
                    self.answerStatus = .wrong
                }
            }
        }
    }
}

enum AnswerStatus {
    case correct, close, wrong, none, nextRoom
}
