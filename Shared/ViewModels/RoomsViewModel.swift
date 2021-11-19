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
            guard let rooms = response?.data else {
                Logger.error(error.debugDescription)
                return
            }
            Logger.debug("GOT ROOMS: \(rooms.compactMap{ $0 })" )
            self.allInfo = rooms.compactMap{ $0 }
            let nextRoomStarQuota = rooms.first(where: { !($0?.journey?.roomUnlocked ?? false) })??.room?.starQuota ?? 0
            self.starsRequired = nextRoomStarQuota - (self.user?.stars ?? 0)
            
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
            
            self.starsNeeded = response?.starsNeeded ?? 0
            switch status {
            case .locked:
                self.presentRoomLocked = true
            case .canUnlock:
                self.navigateToPowerups = true
            case .unlocked:
                self.navigateToRoom = true
            case .complete:
                self.roomSolved = true
            }
        }
    }
    
}
