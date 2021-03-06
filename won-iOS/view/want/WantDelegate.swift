//
//  WantDelegate.swift
//  won-iOS
//
//  Created by Elly Richardson on 12/5/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import UIKit

class WantDelegate : WantRealmViewModelDataAccess, UITableViewDelegate {
    private let SHOW_WANT_DETAILS_SEGUE = "showWantDetails"
    
    weak var delegate: VCDelegate?
    
    private var sortType = WantSortType.DEFAULT
    private var sortOrder = WantSortOrder.DEFAULT
    private var nameFilter = ""
    
    // #2
    init(withDelegate delegate: VCDelegate) {
        self.delegate = delegate
    }
    
    // #3
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if delegate != nil {
            var presentedWantViewModels: [WantViewModel]!
            if !nameFilter.isEmpty {
                presentedWantViewModels = findWantsFilteredByName(wantName: nameFilter)
            } else {
                presentedWantViewModels = findSortedWants(sortType: sortType, sortOrder: sortOrder)
            }
            self.delegate?.selectedCell(sender: presentedWantViewModels[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            var presentedWants: [WantViewModel]!
            if !self.nameFilter.isEmpty {
                presentedWants = self.findWantsFilteredByName(wantName: self.nameFilter)
            } else {
                presentedWants = self.findSortedWants(sortType: self.sortType, sortOrder: self.sortOrder)
            }
            self.deleteAsViewModel(viewModel: presentedWants[indexPath.row])
        }

        let share = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
            // share item at indexPath
            print("SHARE BUTTON PRESSED")
        }

        share.backgroundColor = UIColor.lightGray
        return [delete, share]
    }
    
    func setSortType(sortType: WantSortType) {
        self.sortType = sortType
    }
    
    func setSortOrder(sortOrder: WantSortOrder) {
        self.sortOrder = sortOrder
    }
    
    func setNameFilter(nameFilter: String) {
        self.nameFilter = nameFilter
    }
}
