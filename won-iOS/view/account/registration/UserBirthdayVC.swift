//
//  UserBirthdayVC.swift
//  won-iOS
//
//  Created by Elly Richardson on 4/5/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UIKit

class UserBirthdayVC: UIViewController {
    @IBOutlet weak var birthdatePageLabel: UILabel!
    
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var doneButton: UIButton!
    
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
