//
//  WantDetailsVC.swift
//  won-iOS
//
//  Created by Elly Richardson on 12/2/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import UIKit

class WantDetailsVC: UIViewController {
    private let DETAILS_TABLE_VIEW_SEGUE = "detailsTableViewSegue"
    
    //@IBOutlet weak var wantNameLabel: UILabel!
    private var wantViewModel: WantViewModel?
    
    @IBOutlet weak var dismissPageBtn: UIButton!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var optionsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        wantViewModel?.configureWantNameButtonLabel(button: dismissPageBtn)
    }
    
    func setWantViewModel(wantViewModel: WantViewModel) {
        self.wantViewModel = wantViewModel
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if (segue.identifier == DETAILS_TABLE_VIEW_SEGUE) {
            let detailsTVC = segue.destination as! WantDetailsTableVC
            detailsTVC.setWantViewModel(wantViewModel: wantViewModel!)
            // Now you have a pointer to the child view controller.
            // You can save the reference to it, or pass data to it.
        }
    }
    
    @IBAction func dismissPageBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
