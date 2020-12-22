//
//  NewWantVC.swift
//  won-iOS
//
//  Created by Elly Richardson on 12/2/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import UIKit

class NewWantVC: UIViewController {
    
    private let UNWIND_SEGUE_TO_WANTS = "unwindSegueToWants"
    
    @IBOutlet weak var doneButton: CircleButton!
    @IBOutlet weak var wantAttributesView: UIView!
    
    private var wantName: String?
    private var wantInterestPoints: String?
    private var wantRealmViewModelDataAccess: WantRealmViewModelDataAccess?
    
    /*
    lazy var wantRealmManager: WantRealmManager = {
        let controller = WantRealmManager(dataSource: WantDataSource())
        return controller
    }()*/
    
    
    private lazy var newWantAttributesTableVC: NewWantAttributesTableVC = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var vc = storyboard.instantiateViewController(withIdentifier: "NewWantAttributesTableVC") as! NewWantAttributesTableVC
        
        // Add View Controller as Child View Controller
        vc.didEditWantNameField = { [weak self](item) in
            if let vc = self {
                // Do something with the item.
                self?.wantName = item
            }
        }
        vc.didEditWantInterestPointsField = { [weak self](item) in
            if let vc = self {
                // Do something with the item.
                self?.wantInterestPoints = item
            }
        }
        self.add(asChildViewController: vc)
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //doneButton.addTarget(self, action: #selector(self.doneButtonPressed(_:)), for: .touchUpInside)
        self.wantRealmViewModelDataAccess = WantRealmViewModelDataAccess()
        add(asChildViewController: newWantAttributesTableVC)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    @IBAction func doneButtonPressed(_ sender: CircleButton) {
        let wantViewModel = WantViewModel(id: UUID.init().uuidString, owner: "DUMMY", name: self.wantName!, points: Int(self.wantInterestPoints!)!, notes: "NOTEZZZZ")
        self.wantRealmViewModelDataAccess!.saveWantAsViewModel(viewModel: wantViewModel)
        self.dismiss(animated: true, completion: nil)
        /*
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: self.UNWIND_SEGUE_TO_WANTS, sender: self)
        }*/
    }
    
    /*
    @IBAction func unwindSegueToWants( _ seg: UIStoryboardSegue) {
        if (seg.identifier == UNWIND_SEGUE_TO_WANTS) {
            let wantVC = seg.destination as! WantVC
            // do stuff here
            wantVC.reloadWantsTableViewData()
        }
    }*/
    
    /*
    @objc func doneButtonPressed(_ button: CircleButton) {
        let wantBuilder = WantBuilder()
        let want = wantBuilder.withId(id: UUID.init().uuidString).withName(name: self.wantName!).withPoints(points: Int(self.wantInterestPoints!)!).build()
        viewModel.addNewWant(want: want)
        self.dismiss(animated: true, completion: nil)
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: self.UNWIND_SEGUE_TO_WANTS, sender: self)
        }
    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)
        
        // Add Child View as Subview
        wantAttributesView.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = wantAttributesView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    
    
}
