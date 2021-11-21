//
//  RoomsViewModel.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/4/21.
//

import Foundation
import SwiftUI

class RoomsViewModel: ObservableObject {
    
    @Published var allInfo: [RoomsModel] = []
    @Published var roomUnlocked: Bool = false
    @Published var powerUpSelected: Bool = false
    @Published var navigateToRoom: Bool = false
    @Published var navigateToPowerups: Bool = false
    @Published var toRoom: RoomsModel = RoomsModel(journey: nil, room: nil)
    
    
    @Published var presentPopup: Bool = false

    @Published var alert: EnigmaAlert = EnigmaAlert()
    
    @Published var user: UserModel?
    @Published var starsRequired: Int = 0
    
    init() { }
    
    func resetAll() {
        self.allInfo = []
        self.user = nil
        self.starsRequired = 0
        // TODO reset remaining
    }
    
    func fetchUser() {
        APIClient.request(fromRouter: .getUser) { (response: UserModel?,error) in
            guard let response = response else {
                return
            }
            self.user = response
        }
    }
    
    func fetchAllInfo(){
        
        if let storyData = UserDefaults.standard.data(forKey: AppStorageConstants.journey), let data = try? JSONDecoder().decode([RoomsModel].self, from:storyData) {
            self.allInfo = data
        }
        
        APIClient.request(fromRouter: .allRooms) { (response: AllRoomsResponse?, error) in
            guard let rooms = response?.data else {
                Logger.error(error.debugDescription)
                return
            }
            
            self.allInfo = rooms.compactMap{ $0 }
            self.starsRequired = response?.nextRoomsUnlockedIn ?? 0
            
            if let stars = response?.stars { self.user?.stars = stars }
            
            if let data = try? JSONEncoder().encode(self.allInfo) {
                UserDefaults.standard.set(data, forKey: AppStorageConstants.journey)
            }
        }
    }
    
    func checkIfRoomUnlocked(room: String?) {
        
        guard let room = room else {
            Logger.error("RoomID nil")
            return
        }
        
        let request = RoomUnlock.RoomUnlockRequest(roomId: room)
        APIClient.request(fromRouter: .unlockRoom(request)) { (response: RoomUnlock.RoomUnlockResponse?, error) in
            guard let status = response?.status else {
                Logger.error(error)
                return
            }
            
            withAnimation{
            switch status {
            case .locked:
                self.alert = EnigmaAlert(title: "You require \(response?.starsNeeded ?? 0) more keys to unlock this room!",showCloseButton:true ,closeAction: self.closePopup)
                self.presentPopup = true

            case .canUnlock:
                self.navigateToPowerups = true
                self.toRoom = self.allInfo.first(where: {$0.room?._id == room}) ?? RoomsModel(journey: nil, room: nil)
            case .unlocked:
                self.navigateToRoom = true
                self.toRoom = self.allInfo.first(where: {$0.room?._id == room}) ?? RoomsModel(journey: nil, room: nil)
            case .complete:
                self.alert = EnigmaAlert(title: "You have already solved all the questions in this room!",showCloseButton:true, closeAction: self.closePopup,widthPercentage: 0.5)
                self.presentPopup = true
            }
            }
        }
    }
    
    func closePopup() {
        self.presentPopup = false
    }
}
