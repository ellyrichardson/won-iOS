//
//  UserDetailsViewController.swift
//  won-iOS
//
//  Created by Elly Richardson on 4/5/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UIKit
import AnimatedField

class UserDetailsVC: UIViewController {
    
    @IBOutlet weak var firstNameAnimatedField: AnimatedField!
    @IBOutlet weak var lastNameAnimatedField: AnimatedField!
    @IBOutlet weak var birthDateLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
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
