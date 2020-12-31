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
    
    func runInitialWantsDaysLeftCheck() {
        let wantViewModels = dataAccess.findAllWants()
        for wantViewModel in wantViewModels {
            let wantDueDate = DateUtils.addDayToDate(date: wantViewModel.getDateCreated(), days: 30.0)
            print(wantViewModel.getDateCreated())
            print("NEW  STUFF")
            print(wantDueDate)
            let expectedDaysLeft = DateUtils.daysBetweenTwoDates(earlyDate: Date(), laterDate: wantDueDate)
            if wantViewModel.getDaysLeft() != expectedDaysLeft {
                dataAccess.updateDaysLeftAsViewModel(viewModel: wantViewModel, daysLeft: expectedDaysLeft)
            }
        }
    }
    
    func runTimerBasedAsyncWantsDaysLeft() {
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireCheckingOfDaysLeft), userInfo: nil, repeats: true)
    }
    
    @objc private func fireCheckingOfDaysLeft() {
        runInitialWantsDaysLeftCheck()
    }
}
