//
//  WantViewModelProcessor.swift
//  won-iOS
//
//  Created by Elly Richardson on 3/21/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UIKit

class WantExactDetailsTableVCProcessorImpl: WantExactDetailsTableVCProcessor {
    private var dataAccess: WantRealmViewModelDataAccessProtocol
    
    private var viewModel: WantViewModel
    
    init(dataAccess: WantRealmViewModelDataAccessProtocol, viewModel: WantViewModel) {
        self.dataAccess = dataAccess
        self.viewModel = viewModel
    }
    
    func setDataAccess(dataAccess: WantRealmViewModelDataAccessProtocol) {
        self.dataAccess = dataAccess
    }
    
    func setViewModel(viewModel: WantViewModel) {
        self.viewModel = viewModel
    }
    
    func configureLabels(interestPointsValueLabel: UILabel, dateCreatedValueLabel: UILabel, dateModifiedValueLabel: UILabel, obtainedAtValueLabel: UILabel, daysLeftValueLabel: UILabel, obtainedValueLabel: UILabel) {
        interestPointsValueLabel.text = viewModel.getPoints()
        dateCreatedValueLabel.text = DateTimeFunctions.dateToStringDMmmY(date: viewModel.getDateCreated())
        dateModifiedValueLabel.text = DateTimeFunctions.dateToStringDMmmY(date: viewModel.getDateModified())
        configureWantObtainedDateValueLabel(label: obtainedAtValueLabel)
        daysLeftValueLabel.text = String(viewModel.getDaysLeft())
        configureWantObtainedValueLabel(label: obtainedValueLabel)
    }
    
    func configureInteractables(btn: UIButton) {
        configureObtainedButton(btn: btn)
    }
    
    func obtainedBtnPressed(btn: UIButton, label: UILabel) {
        viewModel.setObtained(obtained: !viewModel.isObtained())
        configureObtainedButton(btn: btn)
        configureWantObtainedValueLabel(label: label)
        self.dataAccess.updateObtainedAsViewModel(viewModel: viewModel)
    }
    
    private func configureObtainedButton(btn: UIButton) {
        if viewModel.isObtained() {
            let image = UIImage(named: "dark-blue-ok-image") as UIImage?
            btn.setBackgroundImage(image, for: .normal)
        } else {
            let image = UIImage(named: "blank-radio-button") as UIImage?
            btn.setBackgroundImage(image, for: .normal)
        }
    }
    
    private func configureWantObtainedDateValueLabel(label: UILabel) {
        if viewModel.getObtainedDate() == nil {
            label.text = "---------"
        } else {
            label.text = DateTimeFunctions.dateToStringDMmmY(date: viewModel.getObtainedDate()!)
        }
    }
    
    private func configureWantObtainedValueLabel(label: UILabel) {
        if viewModel.isObtained() {
            label.text = "OBTAINED"
        } else {
            label.text = "NOT OBTAINED"
        }
    }
}
