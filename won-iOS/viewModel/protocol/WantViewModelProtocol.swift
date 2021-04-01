//
//  WantViewModelProtocol.swift
//  won-iOS
//
//  Created by Elly Richardson on 3/21/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UIKit

protocol WantViewModelProtocol {
    func configureTableViewCell(cell: WantTVCell)
    /*
    func configureWanterestPointsValueLabel(label: UILabel)
    func configureWantDateCreatedValueLabel(label: UILabel)
    func configureWantDateModifiedValueLabel(label: UILabel)
    func configureWantDaysLeftValueLabel(label: UILabel)
 */
    //func configureWantNameButtonLabel(button: UIButton)
    /*
    func configureWantObtainedValueLabel(label: UILabel)
    func configureWantObtainedDateValueLabel(label: UILabel)
 */
    func configureWantImageView(imageView: UIImageView)
    // Only for WantExactDetailsTableVC use
    func configureObtainedBackgroundColorFor(cell: UITableViewCell)
    // Only for WantExactDetailsTableVC use
    func configureGeneralBackgroundColorFor(cell: UITableViewCell)
    func configureObtainedButton(btn: UIButton)
    func configureObtainedValueLabel(label: UILabel)
    func setOwner(owner: String)
    func getOwner() -> String
    func setName(name: String)
    func getName() -> String
    func setPoints(points: String)
    func getPoints() -> String
    func setNotes(notes: String)
    func getNotes() -> String
    func setDaysLeft(daysLeft: Int)
    func getDaysLeft() -> Int
    func setId(id: String)
    func getId() -> String
    func setImage(image: UIImage)
    func getImage() -> UIImage
    func setObtained(obtained: Bool)
    func isObtained() -> Bool
    func getObtainedDate() -> Date?
    func setObtainedDate(obtainedDate: Date)
    func setDateCreated(dateCreated: Date)
    func getDateCreated() -> Date
    func setDateModified(dateModified: Date)
    func getDateModified() -> Date
    func setNotificationViewModel(notificationViewModel: WantNotificationViewModel)
    func getNotificationViewModel() -> WantNotificationViewModel?
    func save()
    // To update WantDetailsTableVC when a Want is being edited
    //func updateWantDetails(wantViewModel: WantViewModel, detailsTableVC: WantDetailsTableVC)
    func createNotification()
}
