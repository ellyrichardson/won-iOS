//
//  WantNotificationViewModel.swift
//  won-iOS
//
//  Created by Elly Richardson on 2/9/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import Foundation

class WantNotificationViewModel {
    //private var notification: WantNotification
    private var daysLeft: Int
    private var repeating: Bool
    private var notifying: Bool
    
    init() {
        //self.notification = WantNotification()
        //self.notification.setDaysLeft(daysLeft: 3)
        //self.notification.setRepeating(repeating: true)
        //self.notification.setNotifying(notifying: true)
        self.daysLeft = 3
        self.repeating = true
        self.notifying = true
    }
    
    //init(notification: WantNotification) {
      //  self.notification = notification
    //}
    
    init(daysLeft: Int, repeating: Bool, notifying: Bool) {
        //self.notification = WantNotification()
        self.daysLeft = daysLeft
        self.repeating = repeating
        self.notifying = notifying
    }
    
    func isNotifying() -> Bool {
        return self.notifying
    }
    
    func setNotifying(notifying: Bool) {
        self.notifying = notifying
    }
    
    func isRepeating() -> Bool {
        return self.repeating
    }
    
    func setRepeating(repeating: Bool) {
        self.repeating = repeating
    }
    
    func getDaysLeft() -> Int {
        return self.daysLeft
    }
    
    func setDaysLeft(daysLeft: Int) {
        self.daysLeft = daysLeft
    }
}
