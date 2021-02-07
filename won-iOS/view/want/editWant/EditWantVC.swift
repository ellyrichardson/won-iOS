//
//  EditWantVC.swift
//  won-iOS
//
//  Created by Elly Richardson on 2/3/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UIKit
import SwiftEntryKit

class EditWantVC: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var interestPointTextField: UITextField!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    weak var detachedVCDelegate: DetachedVCDelegate?
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        SwiftEntryKit.dismiss()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        SwiftEntryKit.dismiss()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //self.navigationController!.dismiss(animated: false, completion:nil);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.isNavigationBarHidden = true
    }
}
