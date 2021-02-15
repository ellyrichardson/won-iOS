//
//  NotificationUtil.swift
//  won-iOS
//
//  Created by Elly Richardson on 2/14/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UserNotifications

class NotificationUtil {
    static func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Notifications Authorized")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
