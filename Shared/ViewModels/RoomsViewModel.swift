//
//  RoomsViewModel.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/4/21.
//

import Foundation

class RoomsViewModel: ObservableObject {
    @Published var allInfo: [RoomsModel] = []
    @Published var roomUnlocked: Bool = false
    @Published var starsNeeded: Int = 999
    @Published var presentRoomLocked: Bool = false
    @Published var powerUpSelected: Bool = false
    @Published var navigateToRoom: Bool = false
    @Published var navigateToPowerups: Bool = false
    @Published var roomSolved: Bool = false
    @Published var toRoom: RoomsModel = RoomsModel(journey: nil, room: nil)

    
    @Published var user: UserModel?
    @Published var starsRequired: Int = 0
    
    init() {
        fetchUser()
        fetchAllInfo()
    }
    
    func fetchUser(){
        APIClient.request(fromRouter: .getUser) { (response: UserModel?,error) in
            guard let response = response else {
                return
            }
            self.user = response
        }
    }
    
    func fetchAllInfo(){
        APIClient.request(fromRouter: .allRooms) { (response: AllRoomsResponse?, error) in
            guard let response = response else {
                Logger.error(error.debugDescription)
                return
            }
            if let rooms = response.data as? [RoomsModel] {
                self.allInfo = rooms
                let nextRoomStarQuota = rooms.first(where: { !($0.journey?.roomUnlocked ?? false) })?.room?.starQuota ?? 0
                self.starsRequired = nextRoomStarQuota - (self.user?.stars ?? 0)
            }
        }
    }
    
    func checkIfRoomSolved(room: RoomsModel?) -> Bool {
        guard let questions = room?.journey?.questionsStatus as? [questionStatus] else {return false}
        var roomSolved = true
        for question in questions {
            if question != .solved {
                roomSolved = false
                break
            }
        }
        return roomSolved
    }
    
    func checkIfRoomUnlocked(room: RoomsModel?) {
        guard let room = room else {return}
        let request = RoomUnlock.RoomUnlockRequest(roomId: room.room?._id)
        APIClient.request(fromRouter: .unlockRoom(request)) { (response: RoomUnlock.RoomUnlockResponse?, error) in
            guard let response = response else { return }
            self.roomUnlocked = response.unlock ?? false
            self.starsNeeded = response.starsNeeded ?? 999
            if(self.roomUnlocked) {
                self.toRoom = room
                self.navigateToRoom = true
            } else {
                self.roomSolved = false
                self.presentRoomLocked = true
            }
        }
    }
}
