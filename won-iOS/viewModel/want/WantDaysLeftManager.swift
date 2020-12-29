//
//  WantDaysLeftChecker.swift
//  won-iOS
//
//  Created by Elly Richardson on 12/28/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import Foundation

class WantDaysLeftManager {
    private var dataAccess: WantRealmViewModelDataAccess?
    
    init(dataAccess : WantRealmViewModelDataAccess?) {
        self.dataAccess = dataAccess
    }
    
    func checkWantsForDaysLeft(wantViewModels: [WantViewModel]) {
        for wantViewModel in wantViewModels {
            let want: Want = (dataAccess?.findById(id: wantViewModel.getId()))!
            let wantDueDate = DateUtils.addDayToDate(date: want.getDateCreated(), days: 30.0)
            let expectedDaysLeft = DateUtils.daysBetweenTwoDates(earlyDate: want.getDateCreated(), laterDate: wantDueDate)
            if want.getDaysLeft() != expectedDaysLeft {
                want.setDaysLeft(daysLeft: expectedDaysLeft)
                dataAccess?.save(object: want)
            }
        }
    }
}
