//
//  NewWantNotificationsVC.swift
//  won-iOS
//
//  Created by Elly Richardson on 2/8/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UIKit

class NewWantNotificationsVC: UIViewController, UIPickerViewDelegate {
    
    
    @IBOutlet weak var dismissPageBtn: UIButton!
    @IBOutlet weak var notifyOnDaysLeftPickerView: UIPickerView!
    @IBOutlet weak var enabledSwitch: UISwitch!
    @IBOutlet weak var repeatingSwitch: UISwitch!
    
    private var delegate: DataReceivingVCProtocol?
    private var wantNotif: WantNotification?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notifyOnDaysLeftPickerView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //wantNotif =
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
        //let daysLeft = notifyOnDaysLeftPickerView.sele
        let wantNotif = createWantNotification(daysLeft: <#T##Int#>, repeating: <#T##Bool#>, notifying: <#T##Bool#>)
        self.dismiss(animated: true, completion: nil)
    }
    
    private func createWantNotification(daysLeft: Int, repeating: Bool, notifying: Bool) -> WantNotification {
        let wantNotifBuilder = WantNotificationBuilder()
        return wantNotifBuilder
            .withDaysLeft(daysLeft: daysLeft)
            .withNotifying(notifying: notifying)
            .withRepeating(repeating: repeating)
            .build()
    }
    
    func setDelegate(delegate: DataReceivingVCProtocol) {
        self.delegate = delegate
    }

}
