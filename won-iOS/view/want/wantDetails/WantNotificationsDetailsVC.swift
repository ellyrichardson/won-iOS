//
//  WantNotificationsDetailsVC.swift
//  won-iOS
//
//  Created by Elly Richardson on 2/12/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UIKit

class WantNotificationsDetailsVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var notifyWithDaysLeftPickerView: UIPickerView!
    @IBOutlet weak var enabledSwitch: UISwitch!
    @IBOutlet weak var repeatingSwitch: UISwitch!
    
    private var daysLeftPickerData: [String] = [String]()

    private var wantViewModel: WantViewModel?
    private var dataAccess: WantRealmViewModelDataAccess?
    
    private let FIRST = 0
    private var didSwitchChange = false
    
    // MOVE OUT some parts to vcProcessor
    override func viewDidLoad() {
        super.viewDidLoad()
        notifyWithDaysLeftPickerView.delegate = self
        notifyWithDaysLeftPickerView.dataSource = self
        daysLeftPickerData = ["1","2","3","4","5","6","7","8","9","10",
                              "11","12","13","14","15"]
        let wantNotif = wantViewModel?.getNotificationViewModel()
        print("DAYS LEFT")
        print((wantNotif?.getDaysLeft())!)
        print("REPEATING")
        print((wantNotif?.isRepeating())!)
        print("NOTIFYING")
        print((wantNotif?.isNotifying())!)
        // Minus 1 days left due to array indexing
        notifyWithDaysLeftPickerView.selectRow((wantNotif?.getDaysLeft())! - 1, inComponent: FIRST, animated: true)
        repeatingSwitch.setOn((wantNotif?.isRepeating())!, animated: true)
        enabledSwitch.setOn((wantNotif?.isNotifying())!, animated: true)
    }
    
    // MOVE OUT all parts to vcProcessor
    // NOTE: Optimize this by only saving if the data actually changed
    override func viewWillDisappear(_ animated: Bool) {
        wantViewModel?.getNotificationViewModel()?.setRepeating(repeating: repeatingSwitch.isOn)
        wantViewModel?.getNotificationViewModel()?.setNotifying(notifying: enabledSwitch.isOn)
        // Updating of the DaysLeft of the ViewModel's notification is handled in the didSelectRow of PickerView
        dataAccess?.updateViewModelNotifications(viewModel: self.wantViewModel!, shouldUpdate: self.didSwitchChange)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        wantViewModel?.getNotificationViewModel()?.setDaysLeft(daysLeft: Int(daysLeftPickerData[row])!)
        self.didSwitchChange = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return daysLeftPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return daysLeftPickerData[row]
    }
    
    func setWantViewModel(wantViewModel: WantViewModel) {
        self.wantViewModel = wantViewModel
    }
    
    func setDataAccess(dataAccess: WantRealmViewModelDataAccess) {
        self.dataAccess = dataAccess
    }
    
    @IBAction func enabledSwitchUpdated(_ sender: UISwitch) {
        self.didSwitchChange = true
    }
    
    @IBAction func repeatingSwitchUpdated(_ sender: UISwitch) {
        self.didSwitchChange = true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
