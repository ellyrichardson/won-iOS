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
    
    // #2
    init(withDelegate delegate: VCDelegate) {
        self.delegate = delegate
    }
    
    // #3
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if delegate != nil {
            let presentedWantViewModels = findAllWants()
            self.delegate?.selectedCell(sender: presentedWantViewModels[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let presentedWants = findAllWants()
        if editingStyle == .delete {
            deleteAsViewModel(viewModel: presentedWants[indexPath.row])
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}
