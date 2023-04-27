//
//  NotificationManager.swift
//  TimeForACut
//
//  Created by richard Haynes on 4/1/23.
//

import Foundation
import UserNotifications
/*
 https://www.youtube.com/watch?v=mG9BVAs8AIo&t=1154s
 */
struct NotificationsManager {
    static let shared = NotificationsManager()
    
    func requestNotificationAuthorization(){
        // Badge is the red numerical icon that displays over apps needing attention
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options){
            (success, error) in
            if let error = error {
                print(error)
            }
            else {
                print("Notficications Approved")
            }
        }
    }
    
    func scheduleNotifications(from dateComponent : DateComponents){
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Might be time for a cut don't you think?"
        notificationContent.subtitle = "Never hurts to be well groomed"
        notificationContent.sound = .default
        notificationContent.badge = 1
        
        let notificationTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        let notificationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: notificationTrigger)
        UNUserNotificationCenter.current().add(notificationRequest)
    }
}
