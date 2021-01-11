//
//  WantDetailsTableVC.swift
//  won-iOS
//
//  Created by Elly Richardson on 12/3/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import UIKit

class WantDetailsTableVC: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    typealias EditedImageHandler = (_ name: UIImage) -> Void
    
    private let DETAILS_TABLE_VIEW_SEGUE = "detailsTableViewSegue"
    
    @IBOutlet weak var wantImage: UIImageView!
    @IBOutlet weak var detailsTableView: UIView!
    private var wantViewModel: WantViewModel?
    private var dataAccess: WantRealmViewModelDataAccess?
    
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
        wantViewModel?.configureWantImageView(imageView: wantImage)
        dataAccess = WantRealmViewModelDataAccess()
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
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        self.wantViewModel?.setImage(image: selectedImage)
        self.dataAccess?.updateImageAsViewModel(viewModel: self.wantViewModel!)
        // Set photoImageView to display the selected image.
        wantImage.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        wantImage.addGestureRecognizer(tap)
        wantImage.isUserInteractionEnabled = true
        /*
        if indexPath.row == 3 || indexPath.row == 4 || indexPath.row == 5 || indexPath.row == 8 || indexPath.row == 9 || indexPath.row == 10 {
            // To remove line separator from tableViewCells
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            cell.directionalLayoutMargins = .zero
        }*/
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
}
