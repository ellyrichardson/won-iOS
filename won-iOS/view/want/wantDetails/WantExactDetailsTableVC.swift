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
    }
    
    private func configureLabels() {
        wantViewModel?.configureWanterestPointsValueLabel(label: interestPointsValueLabel)
        wantViewModel?.configureWantDateCreatedValueLabel(label: dateCreatedValueLabel)
        wantViewModel?.configureWantDateModifiedValueLabel(label: dateModifiedValueLabel)
        wantViewModel?.configureWantObtainedDateValueLabel(label: obtainedAtValueLabel)
        wantViewModel?.configureWantDaysLeftValueLabel(label: daysLeftValueLabel)
    }
}
