//
//  WantDaysLeftChecker.swift
//  won-iOS
//
//  Created by Elly Richardson on 12/28/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import Foundation

class WantManager {
    private var dataAccess = WantRealmViewModelDataAccess()
    
    func runWantsDaysLeftCheck() {
        let wantViewModels = dataAccess.findAllWants()
        for wantViewModel in wantViewModels {
            let wantDueDate = DateUtils.addDayToDate(date: wantViewModel.getDateCreated(), days: 30.0)
            print("Want Days Left Checker is Running - Checking " + wantViewModel.getName())
            let expectedDaysLeft = DateUtils.daysBetweenTwoDates(earlyDate: Date(), laterDate: wantDueDate)
            if wantViewModel.getDaysLeft() != expectedDaysLeft && wantViewModel.getDaysLeft() > 0 {
                dataAccess.updateDaysLeftAsViewModel(viewModel: wantViewModel, daysLeft: expectedDaysLeft)
            }
        }
    }
    
    func setDataAccess(dataAccess: WantRealmViewModelDataAccessProtocol) {
        self.dataAccess = dataAccess as! WantRealmViewModelDataAccess
    }
}
