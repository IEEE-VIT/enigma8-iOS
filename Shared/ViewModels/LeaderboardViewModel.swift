//
//  LeaderboardViewModel.swift
//  Enigma (iOS)
//
//  Created by Alok N on 04/11/21.
//

import Foundation

class LeaderboardViewModel: ObservableObject {
    
    @Published var leaderboard: [LeaderboardItem] = []
    @Published var currentUser: LeaderboardItem?
    var showNoUser: Bool = false
    var searchQuery: String? = nil
    var totalPages = 1
    var currentPage = 1
    
    func fetchLeaderboard(reload: Bool? = false, query: String? = nil, morePages: Bool? = false) {
        if(reload ?? false) {
            self.currentPage = 1
        }
        if(query != nil && (query?.isEmpty ?? false)) {//if searchquery is reset, reset vars and fetch everything again
            currentPage = 1
            //self.leaderboard = []
            self.searchQuery = nil
        } else if(query != nil){
            self.searchQuery = query
            if(!(morePages ?? false)) {
                self.currentPage = 1
            }
        }
        APIClient.request(fromRouter: Router.leaderboard(Leaderboard.Request(page: currentPage, query: searchQuery, perPage: 10))) { (response: Leaderboard.Response?, error) in
            if(error != nil) {
                self.leaderboard = []
                self.showNoUser = true
            }
            guard let response = response else { return }
            if(self.searchQuery != nil || reload ?? false) {
                self.leaderboard = response.leaderboard ?? []
                if(response.leaderboard?.isEmpty ?? false) {
                    self.showNoUser = true
                } else {
                    self.showNoUser = false
                }
            } else {
                self.leaderboard.append(contentsOf: response.leaderboard ?? [])
            }
            self.totalPages = response.totalPage ?? 1
            self.currentUser = response.userRank
        }
    }
    
    func fetchMorePages(currentRow item: LeaderboardItem) {
        let thresholdIndex = self.leaderboard.index(self.leaderboard.endIndex, offsetBy: -1)
        if leaderboard[thresholdIndex].rank == item.rank, currentPage < totalPages {
            currentPage += 1
            fetchLeaderboard(query: self.searchQuery, morePages: true)
        }
    }
}

