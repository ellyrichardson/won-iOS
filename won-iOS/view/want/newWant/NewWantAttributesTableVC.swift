//
//  NewWantAttributesTableVC.swift
//  won-iOS
//
//  Created by Elly Richardson on 12/8/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import UIKit

class NewWantAttributesTableVC: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, DataReceivingVCProtocol, UITextFieldDelegate {
    
    private let SEGUE_TO_NOTES = "newWantNotesVCSegue"
    private let SEGUE_TO_NOTIFICATIONS = "newWantNotificationsVCSegue"
    private let UNWIND_TO_ATTRIBUTES_VC = "unwindToNewWantAttributesTableVC"
    
    typealias EditedTextHandler = (_ name: String) -> Void
    typealias EditedImageHandler = (_ name: UIImage) -> Void
    typealias IsCheckButtonEnabledHandler = (_ name: Bool) -> Void
    typealias EditedNotificationHandler = (_ name: WantNotificationViewModel) -> Void
    
    @IBOutlet weak var wantImage: UIImageView!
    @IBOutlet weak var wantNameField: UITextField!
    @IBOutlet weak var wantInterestPointsField: UITextField!
    @IBOutlet weak var wantNotificationIndicator: UIImageView!
    
    @IBOutlet weak var wantNotesLabel: UILabel!
    
    var didEditWantNameField: (EditedTextHandler)?
    var didEditWantInterestPointsField: (EditedTextHandler)?
    var didChangeWantImage: (EditedImageHandler)?
    var didEditWantNotes: (EditedTextHandler)?
    var isCheckButtonEnabled: (IsCheckButtonEnabledHandler)?
    var didEditWantNotification: (EditedNotificationHandler)?
    
    private var wantNotification = WantNotificationViewModel()
    private var wantNotes = "" // This changes based on the NewWantNotesVC value
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wantNameField.addTarget(self, action: #selector(self.wantNameFieldDidChange(_:)), for: .editingChanged)
        wantInterestPointsField.addTarget(self, action: #selector(self.wantInterestPointsFieldDidChange(_:)), for: .editingChanged)
        
        prepareImage()
    }
    
    func prepareImage() {
        wantImage.layer.cornerRadius = 190
        wantImage.clipsToBounds = true
        wantImage.layer.borderWidth = 2.0
        wantImage.layer.borderColor = UIColor.white.cgColor
    }
    
    @objc func wantNameFieldDidChange(_ textField: UITextField) {
        didEditWantNameField?(wantNameField.text!)
        isCheckButtonEnabled?(areTextFieldsValid())
    }
    
    @objc func wantInterestPointsFieldDidChange(_ textField: UITextField) {
        didEditWantInterestPointsField?(wantInterestPointsField.text!)
        isCheckButtonEnabled?(areTextFieldsValid())
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
        
        // Set photoImageView to display the selected image.
        wantImage.image = selectedImage
        didChangeWantImage?(wantImage.image!)
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    private func areTextFieldsNotEmpty() -> Bool {
        return !self.wantNameField.text!.isEmpty && !self.wantInterestPointsField.text!.isEmpty
    }
    
    private func isInterestPointsValid() -> Bool {
        return self.wantInterestPointsField.text!.isNumeric && (self.wantInterestPointsField.text!.count < 3)
    }
    
    func areTextFieldsValid() -> Bool {
        if areTextFieldsNotEmpty() && isInterestPointsValid() {
            return true
        }
        return false
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        wantImage.addGestureRecognizer(tap)
        wantImage.isUserInteractionEnabled = true
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        wantNameField.resignFirstResponder()
        wantInterestPointsField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if (segue.identifier == SEGUE_TO_NOTES) {
            let notesVC = segue.destination as! NewWantNotesVC
            notesVC.setDelegate(delegate: self)
            notesVC.setWantNotes(notes: wantNotes)
        }
        if (segue.identifier == SEGUE_TO_NOTIFICATIONS) {
            let notifVC = segue.destination as! NewWantNotificationsVC
            notifVC.setDelegate(delegate: self)
            notifVC.setWantNotificationViewModel(wantNotifViewModel: self.wantNotification)
        }
    }
    
    func passData(data: Any) {
        if let passedData = data as? String {
            self.wantNotes = passedData
            didEditWantNotes!(passedData)
        } else if let passedData = data as? WantNotificationViewModel {
            didEditWantNotification!(passedData)
            if passedData.isNotifying() {
                wantNotificationIndicator.image = UIImage(named: "notification-image")
            } else {
                wantNotificationIndicator.image = UIImage(named: "greyscale-notification-image")
            }
        }
    }
}
