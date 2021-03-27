//
//  ViewModelProcessorProtocol.swift
//  won-iOS
//
//  Created by Elly Richardson on 3/21/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UIKit

protocol WantExactDetailsTableVCProcessor {
    func setDataAccess(dataAccess: WantRealmViewModelDataAccessProtocol)
    func setViewModel(viewModel: WantViewModel)
    func obtainedBtnPressed(btn: UIButton, label: UILabel)
    func configureLabels(interestPointsValueLabel: UILabel, dateCreatedValueLabel: UILabel, dateModifiedValueLabel: UILabel, obtainedAtValueLabel: UILabel, daysLeftValueLabel: UILabel, obtainedValueLabel: UILabel)
    func configureInteractables(btn: UIButton)
}
