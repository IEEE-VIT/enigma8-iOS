//
//  NotificationManager.swift
//  Enigma (iOS)
//
//  Created by Aaryan Kothari on 18/11/21.
//

import UIKit
import Firebase
import FirebaseMessaging

class NotificationManager: NSObject {

    static let shared = NotificationManager()

    var isPushEnabled: Bool = false
    var notificationCenter = UNUserNotificationCenter.current()

    // UserDefault keys for device info
    struct Keys {
        static let deviceToken = "deviceToken"
        static let fcmToken = "fcmToken"
        static let isFCMTokenUploaded = "isFCMTokenUploaded"
    }

    class var deviceToken: String {
        get {
            if let deviceToken = UserDefaults.standard.string(forKey: Keys.deviceToken) {
                return deviceToken
            } else {
                return "deviceToken"
            }
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.deviceToken)
        }
    }

    class var fcmToken: String? {
        get {
            if let fcmToken = UserDefaults.standard.string(forKey: Keys.fcmToken) {
                return fcmToken
            }
            return nil
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.fcmToken)
        }
    }

    var isFCMTokenUploaded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.isFCMTokenUploaded)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.isFCMTokenUploaded)
        }
    }

    func registerForPushNotifications() {
        UIApplication.shared.registerForRemoteNotifications()
        self.notificationCenter.delegate = self
        Messaging.messaging().delegate = self
        self.notificationCenter.getNotificationSettings(completionHandler: { (settings) in
            switch settings.authorizationStatus {
            case .authorized, .provisional:
                self.isPushEnabled = true
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            case .denied, .ephemeral:
                break
            case .notDetermined:
                self.notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
                    if granted && error == nil {
                        self.isPushEnabled = true
                        DispatchQueue.main.async {
                            UIApplication.shared.registerForRemoteNotifications()
                        }
                    } else {
                    }
                }
            @unknown default:
                break
            }
        })
    }

    func didRegisterForRemoteNotifications(_ tokenData: Data) {
        //check if the device token to be uploaded
        let tokenParts = tokenData.map { data -> String in
            return String(format: "%02.2hhx", data)
        }
        let newToken = tokenParts.joined()
        if newToken != NotificationManager.deviceToken {
            NotificationManager.deviceToken = newToken
            Messaging.messaging().apnsToken = tokenData
        } else if NotificationManager.fcmToken == nil {
            Messaging.messaging().apnsToken = tokenData
        }
    }

    func setFCMToken(_ token: String) {
        if NotificationManager.fcmToken != token {
            NotificationManager.fcmToken = token
            self.isFCMTokenUploaded = false
        }
        self.updateUserDeviceInfo()
    }

    func updateUserDeviceInfo() {
        guard !self.isFCMTokenUploaded, NotificationManager.fcmToken != nil else {
            return
        }
        
        // TODO send to backend
    }

    private func didReceiveNotification(_ notification: UNNotification) {

    }

    func clearNotifications() {
        UIApplication.shared.applicationIconBadgeNumber = 0
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

extension NotificationManager: UNUserNotificationCenterDelegate, MessagingDelegate {

    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
            completionHandler()
        }

    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge,.list])
    }

    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        // Note: This callback is fired at each app startup and whenever a new token is generated.
        Logger.verbose("FCM token: \(fcmToken ?? "")")
        if let fcmToken = fcmToken {
            self.setFCMToken(fcmToken)
        }
    }

}
