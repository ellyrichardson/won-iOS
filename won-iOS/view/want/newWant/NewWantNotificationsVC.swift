//
//  NewWantNotificationsVC.swift
//  won-iOS
//
//  Created by Elly Richardson on 2/8/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UIKit

class NewWantNotificationsVC: UIViewController {
    
    
    @IBOutlet weak var dismissPageBtn: UIButton!
    @IBOutlet weak var notifyOnDaysLeftPickerView: UIPickerView!
    @IBOutlet weak var enabledSwitch: UISwitch!
    @IBOutlet weak var repeatingSwitch: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    }

}
