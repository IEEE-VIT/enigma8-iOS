//
//  EnigmaApp.swift
//  Shared
//
//  Created by Aaryan Kothari on 07/09/21.
//

import SwiftUI
import Firebase

@main
struct EnigmaApp: App {
    @StateObject var roomsVM = RoomsViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            HeaderNavView()
                 .environmentObject(roomsVM)
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        PodHelper.configurePods()
        NotificationManager.shared.registerForPushNotifications()
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        NotificationManager.shared.didRegisterForRemoteNotifications(deviceToken)
    }
}
