//
//  WantViewModel.swift
//  won-iOS
//
//  Created by Elly Richardson on 12/21/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import UIKit

class WantViewModel {
    private var id: String
    private var owner: String
    private var name: String
    private var points: Int
    private var notes: String
    private var image: UIImage
    private var daysLeft: Int
    private var obtained: Bool
    private var obtainedDate: Date?
    private var dateCreated: Date
    private var dateModified: Date
    private var notificationViewModel: WantNotificationViewModel?
    
    public init() {
        self.id = ""
        self.owner = ""
        self.name = ""
        self.points = 0
        self.notes = ""
        self.daysLeft = 30
        self.obtained = false
        self.dateCreated = Date()
        self.dateModified = Date()
        self.image = UIImage()
    }
    
    public func configureTableViewCell(cell: WantTVCell) {
        cell.wantName.text = self.name
        cell.pointsLabel.text = String(self.points)
        cell.timeLeftLabel.text = String(self.daysLeft) + " days left"
        cell.obtained = self.obtained
        if image.size.width > 0 {
            cell.wantImage.image = self.image
        }
        if self.obtained {
            cell.backgroundColor = UIColor(named: "won-bluer-teal")
        } else if self.daysLeft < 1 {
            cell.backgroundColor = UIColor(named: "won-red-orange")
        } else {
            cell.backgroundColor = UIColor(named: "won-dark-blue")
        }
    }
    
    public func configureWanterestPointsValueLabel(label: UILabel) {
        label.text = String(self.points)
    }
    
    public func configureWantDateCreatedValueLabel(label: UILabel) {
        label.text = DateTimeFunctions.dateToStringDMmmY(date: self.dateCreated)
    }
    
    public func configureWantDateModifiedValueLabel(label: UILabel) {
        label.text = DateTimeFunctions.dateToStringDMmmY(date: self.dateModified)
    }
    
    public func configureWantDaysLeftValueLabel(label: UILabel) {
        label.text = String(self.daysLeft)
    }
    
    public func configureWantNameButtonLabel(button: UIButton) {
        //label.text = "< " + self.name
        button.setTitle("< " + self.name, for: .normal)
    }
    
    public func configureWantObtainedValueLabel(label: UILabel) {
        if self.obtained {
            label.text = "OBTAINED"
        } else {
            label.text = "NOT OBTAINED"
        }
    }
    
    public func configureWantObtainedDateValueLabel(label: UILabel) {
        if self.obtainedDate == nil {
            label.text = "---------"
        } else {
            label.text = DateTimeFunctions.dateToStringDMmmY(date: self.obtainedDate!)
        }
    }
    
    public func configureWantImageView(imageView: UIImageView) {
        if image.size.width > 0 {
            imageView.image = self.image
        }
    }
    
    // Only for WantExactDetailsTableVC use
    public func configureObtainedBackgroundColorFor(cell: UITableViewCell) {
        if self.obtained {
            cell.contentView.backgroundColor = UIColor(named: "won-dark-blue")
        } else {
            cell.contentView.backgroundColor = UIColor(named: "won-light-orange")
        }
    }
    
    // Only for WantExactDetailsTableVC use
    public func configureGeneralBackgroundColorFor(cell: UITableViewCell) {
        if !self.obtained && self.daysLeft < 1 {
            cell.contentView.backgroundColor = UIColor(named: "won-red-orange")
        } else {
            cell.contentView.backgroundColor = UIColor(named: "won-light-orange")
        }
    }
    
    public func configureObtainedButton(btn: UIButton) {
        if self.obtained {
            let image = UIImage(named: "dark-blue-ok-image") as UIImage?
            btn.setBackgroundImage(image, for: .normal)
        } else {
            let image = UIImage(named: "blank-radio-button") as UIImage?
            btn.setBackgroundImage(image, for: .normal)
        }
    }
    
    public func configureObtainedValueLabel(label: UILabel) {
        if self.obtained {
            label.text = "OBTAINED"
        } else {
            label.text = "NOT OBTAINED"
        }
    }
    
    public func setOwner(owner: String) {
        self.owner = owner
    }
    
    public func getOwner() -> String {
        return owner
    }
    
    public func setName(name: String) {
        self.name = name
    }
    
    public func getName() -> String {
        return name
    }
    
    public func setPoints(points: String) {
        self.points = Int(points)!
    }
    
    public func getPoints() -> String {
        return String(points)
    }
    
    public func setNotes(notes: String) {
        self.notes = notes
    }
    
    public func getNotes() -> String {
        return notes
    }
    
    public func setDaysLeft(daysLeft: Int) {
        self.daysLeft = daysLeft
    }
    
    public func getDaysLeft() -> Int {
        if daysLeft < 1 {
            return 0
        }
        return daysLeft
    }
    
    public func setId(id: String) {
        self.id = id
    }
    
    public func getId() -> String {
        return id
    }
    
    func setImage(image: UIImage) {
        self.image = image
    }
    
    func getImage() -> UIImage {
        return image
    }
    
    public func setObtained(obtained: Bool) {
        self.obtained = obtained
    }
    
    public func isObtained() -> Bool {
        return obtained
    }
    
    public func getObtainedDate() -> Date? {
        if obtainedDate != nil {
            return obtainedDate!
        } else {
            return nil
        }
    }
    
    public func setObtainedDate(obtainedDate: Date) {
        self.obtainedDate = obtainedDate
    }
    
    public func setDateCreated(dateCreated: Date) {
        self.dateCreated = dateCreated
    }
    
    public func getDateCreated() -> Date {
        return dateCreated
    }
    
    public func setDateModified(dateModified: Date) {
        self.dateModified = dateModified
    }
    
    public func getDateModified() -> Date {
        return dateModified
    }
    
    public func setNotificationViewModel(notificationViewModel: WantNotificationViewModel) {
        self.notificationViewModel = notificationViewModel
    }
    
    public func getNotificationViewModel() -> WantNotificationViewModel? {
        if self.notificationViewModel != nil {
            return self.notificationViewModel!
        }
        return nil
    }
    
    func save() {
        
    }
    
    // To update WantDetailsTableVC when a Want is being edited
    public func updateWantDetails(wantViewModel: WantViewModel, detailsTableVC: WantDetailsTableVC) {
        detailsTableVC.setWantViewModel(wantViewModel: wantViewModel)
        detailsTableVC.tableView.reloadData()
    }
    
    public func createNotification() {
        
    }
    
}
