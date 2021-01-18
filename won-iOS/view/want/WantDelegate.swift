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
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            let presentedWants = self.findAllWants()
            self.deleteAsViewModel(viewModel: presentedWants[indexPath.row])
        }

        let share = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
            // share item at indexPath
            print("SHARE BUTTON PRESSED")
        }

        share.backgroundColor = UIColor.lightGray
        return [delete, share]
    }
}
