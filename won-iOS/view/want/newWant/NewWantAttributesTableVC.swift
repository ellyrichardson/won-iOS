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
    private let UNWIND_TO_ATTRIBUTES_VC = "unwindToNewWantAttributesTableVC"
    
    //private var checkButtonEnabled = false
    
    typealias EditedTextHandler = (_ name: String) -> Void
    typealias EditedImageHandler = (_ name: UIImage) -> Void
    typealias IsCheckButtonEnabledHandler = (_ name: Bool) -> Void
    
    @IBOutlet weak var wantImage: UIImageView!
    @IBOutlet weak var wantNameField: UITextField!
    @IBOutlet weak var wantInterestPointsField: UITextField!
    
    @IBOutlet weak var wantNotesLabel: UILabel!
    
    var didEditWantNameField: (EditedTextHandler)?
    var didEditWantInterestPointsField: (EditedTextHandler)?
    var didChangeWantImage: (EditedImageHandler)?
    var didEditWantNotes: (EditedTextHandler)?
    var isCheckButtonEnabled: (IsCheckButtonEnabledHandler)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wantNameField.addTarget(self, action: #selector(self.wantNameFieldDidChange(_:)), for: .editingChanged)
        wantInterestPointsField.addTarget(self, action: #selector(self.wantInterestPointsFieldDidChange(_:)), for: .editingChanged)
        
        prepareImage()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func prepareImage() {
        wantImage.layer.cornerRadius = 190//wantImage.frame.size.width/2.1
        wantImage.clipsToBounds = true
        wantImage.layer.borderWidth = 2.0
        wantImage.layer.borderColor = UIColor.white.cgColor
    }
    
    @objc func wantNameFieldDidChange(_ textField: UITextField) {
        didEditWantNameField?(wantNameField.text!)
        isCheckButtonEnabled?(areTextFieldsNotEmpty())
    }
    
    @objc func wantInterestPointsFieldDidChange(_ textField: UITextField) {
        didEditWantInterestPointsField?(wantInterestPointsField.text!)
        isCheckButtonEnabled?(areTextFieldsNotEmpty())
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
    
    func areTextFieldsNotEmpty() -> Bool {
        if !self.wantNameField.text!.isEmpty && !self.wantInterestPointsField.text!.isEmpty {
            return true
        }
        return false//self.checkButtonEnabled
    }
    
    /*
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)

        if !text.isEmpty{
            self.checkButtonEnabled = true
        } else {
            self.checkButtonEnabled = false
        }
        return true
    }*/
    
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
            //let destNavCtrl = segue.destination as! UINavigationController
            //let notesVC = destNavCtrl.topViewController as! NewWantNotesVC
            notesVC.setDelegate(delegate: self)
        }
    }
    
    /*
    @IBAction func unwindToHere( _ seg: UIStoryboardSegue) {
        if let sourceVC = seg.source as? NewWantNotesVC {
            didEditWantNotes!(sourceVC.getWantNotes())
        }
    }*/
    
    func passData(data: Any) {
        let stringg = data as! String
        didEditWantNotes!(stringg)
    }
    
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4 {
            self.performSegue(withIdentifier: SEGUE_TO_NOTES, sender: self)
        }
    }*/

    // MARK: - Table view data source
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }*/

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
