//
//  WantDetailsTableVC.swift
//  won-iOS
//
//  Created by Elly Richardson on 12/3/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import UIKit

class WantDetailsTableVC: UITableViewController {
    private let DETAILS_TABLE_VIEW_SEGUE = "detailsTableViewSegue"
    
    @IBOutlet weak var wantImage: UIImageView!
    @IBOutlet weak var detailsTableView: UIView!
    private var wantViewModel: WantViewModel?
    
    func setWantViewModel(wantViewModel: WantViewModel) {
        self.wantViewModel = wantViewModel
    }
    
    private lazy var wantExactDetailsTableVC: WantExactDetailsTableVC = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var vc = storyboard.instantiateViewController(withIdentifier: "WantExactDetailsTableVC") as! WantExactDetailsTableVC

        self.add(asChildViewController: vc)
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wantExactDetailsTableVC.setWantViewModel(wantViewModel: wantViewModel!)
        add(asChildViewController: wantExactDetailsTableVC)
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)
        
        // Add Child View as Subview
        detailsTableView.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = detailsTableView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
}
