//
//  WantNotificationViewModel.swift
//  won-iOS
//
//  Created by Elly Richardson on 2/9/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import Foundation

class WantNotificationViewModel {
    private var notification: WantNotification
    
    init(notification: WantNotification) {
        self.notification = notification
    }
    
    func isNotifying() -> Bool {
        return notification.isNotifying()
    }
    
    func setNotifying(notifying: Bool) {
        self.notification.setNotifying(notifying: notifying)
    }
    
    func isRepeating() -> Bool {
        return notification.isRepeating()
    }
    
    func setRepeating(repeating: Bool) {
        self.notification.setRepeating(repeating: repeating)
    }
    
    func getDaysLeft() -> Int {
        return notification.getDaysLeft()
    }
    
    func setDaysLeft(daysLeft: Int) {
        self.notification.setDaysLeft(daysLeft: daysLeft)
    }
}
