//
//  TimerProcess.swift
//  won-iOS
//
//  Created by Elly Richardson on 1/4/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import Foundation

class TimerProcess: NSObject {
    static let sharedTimer: TimerProcess = {
       let timer = TimerProcess()
        return timer
    }()

    var internalTimer: Timer?
    var jobs = [() -> Void]()

    func startTimer(withInterval interval: Double, andJob job: @escaping () -> Void) {
        jobs.append(job)
        print("startTimer process activated")
        /*
        if internalTimer != nil {
            internalTimer?.invalidate()
        }
        internalTimer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(doJob), userInfo: nil, repeats: true)*/
        runTimer(withInterval: interval)
    }

    func pauseTimer() {
        print("pauseTimer process activated")
        guard internalTimer != nil else {
            print("No timer active, start the timer before you stop it.")
            return
        }
        internalTimer?.invalidate()
    }
    
    func runTimer(withInterval interval: Double) {
        print("runTimer process activated")
        if internalTimer != nil {
            internalTimer?.invalidate()
        }
        internalTimer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(doJob), userInfo: nil, repeats: true)
    }

    func stopTimer() {
        print("stopTimer process activated")
        guard internalTimer != nil else {
            print("No timer active, start the timer before you stop it.")
            return
        }
        jobs = [()->()]()
        internalTimer?.invalidate()
    }

    @objc func doJob() {
        guard jobs.count > 0 else { return }
        for job in jobs {
            job()
        }
    }
}
