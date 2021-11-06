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
    @Published var searchQuery: String = ""
    var noMorePages = false
    var currentPage = 1
    
    func fetchLeaderboard() {
        APIClient.request(fromRouter: Router.leaderboard(Leaderboard.Request(page: currentPage, perPage: 10))) { (response: Leaderboard.Response?, error) in
            guard let response = response else { return }
            if(response.leaderboard.isEmpty) {//checks if whole leaderboard fetched
                self.noMorePages = true
            }
            self.leaderboard.append(contentsOf: response.leaderboard)
            self.currentUser = response.userRank
        }
    }
    
    func searchLeaderboard() {
        if(searchQuery.isEmpty) {//if searchquery is reset, reset vars and fetch everything again
            currentPage = 1
            noMorePages = false
            self.leaderboard = []
            fetchLeaderboard()
        } else {
            APIClient.request(fromRouter: Router.leaderboard(Leaderboard.Request(page: currentPage, query: searchQuery.lowercased(), perPage: 10))) { (response: Leaderboard.Response?, error) in
                guard let response = response else { return }
                if(response.leaderboard.isEmpty) {//Checks if no more users to fetch
                    self.noMorePages = true
                }
                self.leaderboard = response.leaderboard
                self.currentUser = response.userRank
            }
        }
    }
    
    func fetchMorePages(currentRow item: LeaderboardItem) {
        let thresholdIndex = self.leaderboard.index(self.leaderboard.endIndex, offsetBy: -1)
        if leaderboard[thresholdIndex].rank == item.rank, !noMorePages {
            currentPage += 1
            fetchLeaderboard()
        }
    }
}

