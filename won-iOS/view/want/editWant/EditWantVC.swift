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
    
    private var wantViewModel: WantViewModel?
    private var wantRealmViewModelDataAccess = WantRealmViewModelDataAccess()
    
    weak var detachedVCDelegate: DetachedVCDelegate?
    
    func setWantViewModel(wantViewModel: WantViewModel) {
        self.wantViewModel = wantViewModel
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        wantViewModel?.setName(name: nameTextField.text!)
        wantViewModel?.setPoints(points: interestPointTextField.text!)
        detachedVCDelegate?.action(sender: wantViewModel as Any)
        wantRealmViewModelDataAccess.updateViewModel(viewModel: wantViewModel!)
        SwiftEntryKit.dismiss()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        SwiftEntryKit.dismiss()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        nameTextField.addTarget(self, action: #selector(self.nameFieldDidChange(_:)), for: .editingChanged)
        interestPointTextField.addTarget(self, action: #selector(self.interestPointsFieldDidChange(_:)), for: .editingChanged)*/
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameTextField.text = wantViewModel?.getName()
        interestPointTextField.text = wantViewModel?.getPoints()
    }
    
    /*
    @objc func nameFieldDidChange(_ textField: UITextField) {
        wantViewModel?.setName(name: textField.text!)
    }
    
    @objc func interestPointsFieldDidChange(_ textField: UITextField) {
        wantViewModel?.setPoints(points: textField.text!)
    }*/
}
