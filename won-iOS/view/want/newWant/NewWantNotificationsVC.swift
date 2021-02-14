//
//  NewWantNotificationsVC.swift
//  won-iOS
//
//  Created by Elly Richardson on 2/8/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UIKit

class NewWantNotificationsVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    @IBOutlet weak var dismissPageBtn: UIButton!
    @IBOutlet weak var notifyOnDaysLeftPickerView: UIPickerView!
    @IBOutlet weak var enabledSwitch: UISwitch!
    @IBOutlet weak var repeatingSwitch: UISwitch!
    
    private var delegate: DataReceivingVCProtocol?
    private var wantNotif: WantNotificationViewModel?
    
    private var daysLeftPickerData: [String] = [String]()
    private var selectedDaysLeft: Int?
    
    private let FIRST = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notifyOnDaysLeftPickerView.delegate = self
        notifyOnDaysLeftPickerView.dataSource = self
        // This should have 3 as default based on the getDaysLeft from wantNotif
        selectedDaysLeft = wantNotif?.getDaysLeft()
        daysLeftPickerData = ["1","2","3","4","5","6","7","8","9","10",
                              "11","12","13","14","15"]
        // Default selected daysLeft is 3 based on the getDaysLeft from wantNotif
        notifyOnDaysLeftPickerView.selectRow((wantNotif?.getDaysLeft())!, inComponent: FIRST, animated: true)
        repeatingSwitch.setOn((wantNotif?.isRepeating())!, animated: true)
        enabledSwitch.setOn((wantNotif?.isNotifying())!, animated: true)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedDaysLeft = Int(daysLeftPickerData[row])!
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func dismissBtnPressed(_ sender: UIButton) {
        self.wantNotif?.setDaysLeft(daysLeft: selectedDaysLeft!)
        self.wantNotif?.setNotifying(notifying: enabledSwitch.isOn)
        self.wantNotif?.setRepeating(repeating: repeatingSwitch.isOn)
        delegate?.passData(data: self.wantNotif as Any)
        self.dismiss(animated: true, completion: nil)
    }
    
    func setDelegate(delegate: DataReceivingVCProtocol) {
        self.delegate = delegate
    }
    
    func setWantNotificationViewModel(wantNotifViewModel: WantNotificationViewModel) {
        self.wantNotif = wantNotifViewModel
    }

}
