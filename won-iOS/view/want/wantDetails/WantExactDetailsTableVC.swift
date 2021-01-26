//
//  WantExactDetailsTableVC.swift
//  won-iOS
//
//  Created by Elly Richardson on 12/17/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import UIKit

class WantExactDetailsTableVC: UITableViewController {
    
    @IBOutlet weak var interestPointsValueLabel: UILabel!
    @IBOutlet weak var daysLeftValueLabel: UILabel!
    @IBOutlet weak var obtainedValueLabel: UILabel!
    @IBOutlet weak var dateCreatedValueLabel: UILabel!
    @IBOutlet weak var dateModifiedValueLabel: UILabel!
    @IBOutlet weak var obtainedAtValueLabel: UILabel!
    @IBOutlet weak var obtainedButton: UIButton!
    
    private var wantViewModel: WantViewModel?
    
    func setWantViewModel(wantViewModel: WantViewModel) {
        self.wantViewModel = wantViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureLabels()
        configureUI()
    }
    
    private func configureUI() {
        let image = UIImage(named: "dark-blue-ok-image") as UIImage?
        //self.doneButton.setImage(image, for: .normal)
        self.obtainedButton.setBackgroundImage(image, for: .normal)
        //self.doneButton.imageView?.contentMode = .scaleAspectFill
        //self.doneButton.button.setImage(image, for: .normal)
        //self.doneButton.imageEdgeInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
    }
    
    private func configureLabels() {
        wantViewModel?.configureWanterestPointsValueLabel(label: interestPointsValueLabel)
        wantViewModel?.configureWantDateCreatedValueLabel(label: dateCreatedValueLabel)
        wantViewModel?.configureWantDateModifiedValueLabel(label: dateModifiedValueLabel)
        wantViewModel?.configureWantObtainedDateValueLabel(label: obtainedAtValueLabel)
        wantViewModel?.configureWantDaysLeftValueLabel(label: daysLeftValueLabel)
    }
}
