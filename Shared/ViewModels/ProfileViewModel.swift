//
//  ProfileViewModel.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/5/21.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var score: Int = 0
    @Published var rank: Int = 0
    @Published var stars: Int = 0
    @Published var email: String = ""
    // TODO: add currentRoomId and use EnvironmentObject to share roomId and roomNo from RoomsVM
    init(){
        fetchUser()
    }
    
    func fetchUser(){
        APIClient.request(fromRouter: .getUser) { (response: UserModel?,error) in
            guard let response = response else {
                return
            }
            self.username = response.username ?? "Username could not be fetched"
            self.score = response.score ?? 0
            self.rank = response.rank ?? 999
            self.stars = response.stars ?? 0
            self.email = response.email ?? "Email could not be fetched"
            
        }
    }
    
}
