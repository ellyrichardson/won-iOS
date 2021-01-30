//
//  WantExactDetailsTableVCDelegate.swift
//  won-iOS
//
//  Created by Elly Richardson on 1/30/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UIKit

class WantExactDetailsTableVCDelegate: NSObject, UITableViewDelegate {
    weak var delegate: VCDelegate?
    weak var wantViewModel: WantViewModel?
    
    // #2
    init(withDelegate delegate: VCDelegate, wantViewModel: WantViewModel) {
        self.delegate = delegate
        self.wantViewModel = wantViewModel
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 120
        }
        else if indexPath.row == 1 {
            return 100
        }
        else if indexPath.row == 2 {
            return 160
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            self.wantViewModel?.configureObtainedBackgroundColorFor(cell: cell)
        }
    }
}
