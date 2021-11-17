//
//  EnigmaApp.swift
//  Shared
//
//  Created by Aaryan Kothari on 07/09/21.
//

import SwiftUI

@main
struct EnigmaApp: App {
    @StateObject var roomsVM = RoomsViewModel()
    
    init() {
        PodHelper.configurePods()
    }
    
    var body: some Scene {
        WindowGroup {
            HeaderNavView()
                .environmentObject(roomsVM)
        }
    }
}
