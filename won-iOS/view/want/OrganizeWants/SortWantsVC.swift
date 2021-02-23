//
//  SortWantsVC.swift
//  won-iOS
//
//  Created by Elly Richardson on 2/16/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UIKit
import DLRadioButton
import SwiftEntryKit

class SortWantsVC: UIViewController {

    @IBOutlet weak var sortOrderView: UIView!
    @IBOutlet weak var sortAscendingRadioBtn: DLRadioButton!
    @IBOutlet weak var sortDescendingRadioBtn: DLRadioButton!
    @IBOutlet weak var sortTypeByAgeRadioBtn: DLRadioButton!
    @IBOutlet weak var sortTypeByInterestPointsRadioBtn: DLRadioButton!
    @IBOutlet weak var sortBtn: OvalButton!
    
    private var dataReceivingVCDelegate: DataReceivingVCProtocol?
    
    // The array should only have 2 items.
    // The first element should be the SortType
    // The second element should be the SortOrder
    private var selectedSortConfigs = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sortTypeByInterestPointsRadioBtn.otherButtons.append(sortTypeByAgeRadioBtn)
        self.sortTypeByAgeRadioBtn.otherButtons.append(sortTypeByInterestPointsRadioBtn)
        self.sortAscendingRadioBtn.otherButtons.append(sortDescendingRadioBtn)
        self.sortDescendingRadioBtn.otherButtons.append(sortAscendingRadioBtn)
        sortBtn.isEnabled = false
        updateSortBtnColors(isBtnEnabled: false)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sortBtnPressed(_ sender: OvalButton) {
        setupSelectedSortConfigs()
        dataReceivingVCDelegate?.passData(data: selectedSortConfigs)
        SwiftEntryKit.dismiss()
    }
    
    private func setupSelectedSortConfigs() {
        if sortTypeByAgeRadioBtn.isSelected && sortAscendingRadioBtn.isSelected {
            selectedSortConfigs.append(WantSortType.BY_AGE)
            selectedSortConfigs.append(WantSortOrder.ASCENDING)
        }
        else if sortTypeByAgeRadioBtn.isSelected && sortDescendingRadioBtn.isSelected {
            selectedSortConfigs.append(WantSortType.BY_AGE)
            selectedSortConfigs.append(WantSortOrder.DESCENDING)
        }
        else if sortTypeByInterestPointsRadioBtn.isSelected && sortAscendingRadioBtn.isSelected {
            selectedSortConfigs.append(WantSortType.BY_INTEREST_POINTS)
            selectedSortConfigs.append(WantSortOrder.ASCENDING)
        }
        else {
            selectedSortConfigs.append(WantSortType.BY_INTEREST_POINTS)
            selectedSortConfigs.append(WantSortOrder.DESCENDING)
        }
    }
    
    func setDelegate(delegate: DataReceivingVCProtocol) {
        self.dataReceivingVCDelegate = delegate
    }
    
    @IBAction func byInterestPtsBtnPressed(_ sender: DLRadioButton) {
        sender.deselectOtherButtons()
        sortBtn.isEnabled = areSortTypeAndOrderSelected()
    }
    
    @IBAction func byAgeBtnPressed(_ sender: DLRadioButton) {
        sender.deselectOtherButtons()
        sortBtn.isEnabled = areSortTypeAndOrderSelected()
    }
    
    @IBAction func ascendingBtnPressed(_ sender: DLRadioButton) {
        sender.deselectOtherButtons()
        sortBtn.isEnabled = areSortTypeAndOrderSelected()
    }
    
    @IBAction func descendingBtnPressed(_ sender: DLRadioButton) {
        sender.deselectOtherButtons()
        sortBtn.isEnabled = areSortTypeAndOrderSelected()
    }
    
    private func areSortTypeAndOrderSelected() -> Bool {
        if (sortTypeByAgeRadioBtn.isSelected || sortTypeByInterestPointsRadioBtn.isSelected) && (sortAscendingRadioBtn.isSelected || sortDescendingRadioBtn.isSelected) {
            updateSortBtnColors(isBtnEnabled: true)
            return true
        } else {
            updateSortBtnColors(isBtnEnabled: false)
            return false
        }
    }
    
    private func updateSortBtnColors(isBtnEnabled: Bool) {
        if isBtnEnabled {
            self.sortBtn.backgroundColor = UIColor(named: "won-dark-blue")
            //self.sortBtn.titleLabel?.textColor = UIColor.white
        } else {
            self.sortBtn.backgroundColor = UIColor.gray
            //self.sortBtn.titleLabel?.textColor = UIColor.darkGray
        }
    }

}
