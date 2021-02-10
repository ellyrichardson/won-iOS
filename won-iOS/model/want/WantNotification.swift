//
//  WantNotification.swift
//  won-iOS
//
//  Created by Elly Richardson on 2/9/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import RealmSwift

class WantNotification: Object {
    @objc dynamic var daysLeft: Int = 1
    @objc dynamic var notifying = true
    @objc dynamic var repeating = false
    
    convenience init(daysLeft: Int, notifying: Bool, repeating: Bool) {
        self.init()
        self.daysLeft = daysLeft
        self.notifying = notifying
        self.repeating = repeating
    }
    
    public func getDaysLeft() -> Int {
        return self.daysLeft
    }
    
    public func setDaysLeft(daysLeft: Int) {
        self.daysLeft = daysLeft
    }
    
    public func isNotifying() -> Bool {
        return self.notifying
    }
    
    public func setNotifying(notifying: Bool) {
        self.notifying = notifying
    }
    
    public func isRepeating() -> Bool {
        return self.repeating
    }
    
    public func setRepeating(repeating: Bool) {
        self.repeating = repeating
    }
}
