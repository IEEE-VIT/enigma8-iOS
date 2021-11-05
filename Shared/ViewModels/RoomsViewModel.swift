//
//  RoomsViewModel.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/4/21.
//

import Foundation

class RoomsViewModel: ObservableObject {
    @Published var allInfo: [RoomsModel] = []
    init(){
        fetchAllInfo()
    }
    func fetchAllInfo(){
        
        APIClient.request(fromRouter: .allRooms) { (response: AllRoomsResponse?, error) in
            guard let response = response else {
                Logger.error(error.debugDescription)
                return
            }
            if !self.allInfo.isEmpty {
                self.allInfo.removeAll()
            }
            self.allInfo.append(contentsOf: response.data ?? [])
        }
    }
}
