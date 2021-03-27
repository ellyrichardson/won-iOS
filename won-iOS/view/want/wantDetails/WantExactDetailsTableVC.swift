//
//  WantExactDetailsTableVC.swift
//  won-iOS
//
//  Created by Elly Richardson on 12/17/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import UIKit

class WantExactDetailsTableVC: UITableViewController, VCDelegate {
    
    @IBOutlet weak var interestPointsValueLabel: UILabel!
    @IBOutlet weak var daysLeftValueLabel: UILabel!
    @IBOutlet weak var obtainedValueLabel: UILabel!
    @IBOutlet weak var dateCreatedValueLabel: UILabel!
    @IBOutlet weak var dateModifiedValueLabel: UILabel!
    @IBOutlet weak var obtainedAtValueLabel: UILabel!
    @IBOutlet weak var obtainedButton: UIButton!
    
    private var wantViewModel: WantViewModel?
    private var delegate: WantExactDetailsTableVCDelegate?
    private var dataAccess: WantRealmViewModelDataAccess?
    private var vcProcessor: WantExactDetailsTableVCProcessor?
    
    func setDataAccess(dataAccess: WantRealmViewModelDataAccess) {
        self.dataAccess = dataAccess
    }
    
    func setWantViewModel(wantViewModel: WantViewModel) {
        self.wantViewModel = wantViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.delegate = WantExactDetailsTableVCDelegate(withDelegate: self, wantViewModel: self.wantViewModel!)
        self.tableView.delegate = self.delegate
        configureUI()
    }
    
    private func configureUI() {
        self.vcProcessor = WantExactDetailsTableVCProcessorImpl(dataAccess: self.dataAccess!, viewModel: self.wantViewModel!)
        vcProcessor?.configureInteractables(btn: self.obtainedButton)
        vcProcessor?.configureLabels(interestPointsValueLabel: interestPointsValueLabel, dateCreatedValueLabel: dateCreatedValueLabel, dateModifiedValueLabel: dateModifiedValueLabel, obtainedAtValueLabel: obtainedAtValueLabel, daysLeftValueLabel: daysLeftValueLabel, obtainedValueLabel: obtainedValueLabel)
    }
    
    @IBAction func obtainedBtnPressed(_ sender: UIButton) {
        vcProcessor?.obtainedBtnPressed(btn: sender, label: obtainedValueLabel)
        self.tableView.reloadData()
    }
    
    func selectedCell(sender: AnyObject) {
        // Do nothing
    }
}
