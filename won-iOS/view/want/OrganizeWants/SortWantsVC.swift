//
//  SortWantsVC.swift
//  won-iOS
//
//  Created by Elly Richardson on 2/16/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UIKit
import DLRadioButton

class SortWantsVC: UIViewController {

    @IBOutlet weak var sortOrderView: UIView!
    @IBOutlet weak var sortAscendingRadioBtn: DLRadioButton!
    @IBOutlet weak var sortDescendingRadioBtn: DLRadioButton!
    @IBOutlet weak var sortTypeByAgeRadioBtn: DLRadioButton!
    @IBOutlet weak var sortTypeByInterestPointsRadioBtn: DLRadioButton!
    
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

}
