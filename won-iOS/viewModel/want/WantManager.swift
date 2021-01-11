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
            print(wantViewModel.getDateCreated())
            print("NEW  STUFF")
            print(wantDueDate)
            let expectedDaysLeft = DateUtils.daysBetweenTwoDates(earlyDate: Date(), laterDate: wantDueDate)
            if wantViewModel.getDaysLeft() != expectedDaysLeft {
                dataAccess.updateDaysLeftAsViewModel(viewModel: wantViewModel, daysLeft: expectedDaysLeft)
            }
        }
    }
    
    /*
    func startTimerBasedAsyncWantsDaysLeft() {
        /*
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireCheckingOfDaysLeft), userInfo: nil, repeats: true)
        guard self.internalTimer != nil else {
            fatalError("Timer already intialized")
        }*/
        TimerProcess.sharedTimer.startTimer(withInterval: 1.0, andJob: runWantsDaysLeftCheck)
    }
    
    @objc private func fireCheckingOfDaysLeft() {
        runWantsDaysLeftCheck()
    }*/
}
