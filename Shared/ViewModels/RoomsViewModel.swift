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
    @Published var presentNumberOfStars: Bool = false
    @Published var powerUpSelected: Bool = false
    init(){
        fetchAllInfo()
    }
    func fetchAllInfo(){
        
        APIClient.request(fromRouter: .allRooms) { (response: AllRoomsResponse?, error) in
            guard let response = response else {
                Logger.error(error.debugDescription)
                return
            }
            self.allInfo = response.data ?? []
        }
    }
    func checkIfRoomUnlocked(roomId: String) {
        let request = RoomUnlock.RoomUnlockRequest(roomId: roomId)
        APIClient.request(fromRouter: .unlockRoom(request)) { (response: RoomUnlock.RoomUnlockResponse?, error) in
            guard let response = response else { return }
            self.roomUnlocked = response.unlock ?? false
            self.starsNeeded = response.starsNeeded ?? 999
        }
    }
}
