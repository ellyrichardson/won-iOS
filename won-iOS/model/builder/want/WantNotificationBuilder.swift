//
//  File.swift
//  won-iOS
//
//  Created by Elly Richardson on 2/10/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import Foundation

class WantNotificationBuilder {
    private var wantNotif: WantNotification
    
    init() {
        self.wantNotif = WantNotification()
    }
    
    func withDaysLeft(daysLeft: Int) -> WantNotificationBuilder {
        self.wantNotif.setDaysLeft(daysLeft: daysLeft)
        return self
    }
    
    func withNotifying(notifying: Bool)  -> WantNotificationBuilder {
        self.wantNotif.setNotifying(notifying: notifying)
        return self
    }
    
    func withRepeating(repeating: Bool) -> WantNotificationBuilder {
        self.wantNotif.setRepeating(repeating: repeating)
        return self
    }
    
    func build() -> WantNotification {
        return self.wantNotif
    }
}
