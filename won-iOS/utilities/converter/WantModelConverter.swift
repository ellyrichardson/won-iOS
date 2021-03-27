//
//  modelToViewModel.swift
//  won-iOS
//
//  Created by Elly Richardson on 3/13/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import Foundation

class WantModelConverter {
    
    // NOTE: Write test for this
    static func convertToViewModel(want: Want) -> WantViewModel {
        let wantViewModelBuilder = WantViewModelBuilder()
        let wantViewModel = wantViewModelBuilder.withId(id: want.getId())
            .withOwner(owner: want.getOwner())
            .withName(name: want.getName())
            .withNotes(notes: want.getNotes())
            .withPoints(points: want.getPoints())
            .withDateCreated(dateCreated: want.getDateCreated())
            .withDaysLeft(daysLeft: want.getDaysLeft())
            .withObtained(obtained: want.isObtained())
            .withDateModified(dateModified: want.getDateModified())
            .build()
        if want.getObtainedDate() != nil {
            wantViewModel.setObtainedDate(obtainedDate: want.getObtainedDate()!)
        }
        if want.getNotification() != nil {
            let wantNotif = want.getNotification()
            let wantNotifViewModel = WantNotificationViewModel(daysLeft: (wantNotif?.getDaysLeft())!, repeating: (wantNotif?.isRepeating())!, notifying: (wantNotif?.isNotifying())!)
            wantViewModel.setNotificationViewModel(notificationViewModel: wantNotifViewModel)
        }
        return wantViewModel
    }
}
