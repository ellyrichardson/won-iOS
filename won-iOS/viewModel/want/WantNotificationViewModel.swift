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
        // This is actually 3 because of array indexing
        self.daysLeft = 0
        self.repeating = false
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
