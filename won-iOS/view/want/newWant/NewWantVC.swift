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
    private var wantImage: UIImage = UIImage(named: "default_image")!
    private var wantImageUpdated = false
    
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
        vc.didChangeWantImage = { [weak self](item) in
            if let vc = self {
                // Do something with the item.
                self?.wantImage = item
                self?.wantImageUpdated = true
            }
        }
        self.add(asChildViewController: vc)
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.wantRealmViewModelDataAccess = WantRealmViewModelDataAccess()
        add(asChildViewController: newWantAttributesTableVC)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func doneButtonPressed(_ sender: CircleButton) {
        let wantViewModelBuilder = WantViewModelBuilder()
        let wantViewModel = wantViewModelBuilder.withId(id: UUID.init().uuidString)
            .withName(name: self.wantName!)
            .withOwner(owner: "DUMMY")
            .withNotes(notes: "NOTEZZZ")
            .withPoints(points: Int(self.wantInterestPoints!)!)
            .withDateCreated(dateCreated: Date())
            .withDateModified(dateModified: Date())
            .withImage(image: self.wantImage)
            .build()
        //if self.wantImageUpdated {
        //wantViewModel.setImage(image: self.wantImage)
       // }
        self.wantRealmViewModelDataAccess!.saveAsViewModel(viewModel: wantViewModel)
        self.dismiss(animated: true, completion: nil)
    }
    
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
