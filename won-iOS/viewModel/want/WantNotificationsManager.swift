//
//  WantNotificationsManager.swift
//  won-iOS
//
//  Created by Elly Richardson on 2/14/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UserNotifications

class WantNotificationsManager {
    static func scheduleNotificationFromWant(want: Want) {
        let content = UNMutableNotificationContent()
        content.title = want.getName()
        content.subtitle = want.getNotes()
        content.sound = UNNotificationSound.default
        
        // show this notification five seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: (want.getNotification()?.isRepeating())!)
        
        let request = UNNotificationRequest(identifier: want.getId(), content: content, trigger: trigger)
        
        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }
}
