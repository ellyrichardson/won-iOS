//
//  WantRealmSource.swift
//  won-iOS
//
//  Created by Elly Richardson on 12/4/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import RealmSwift

class WantRealmViewModelDataAccess: BaseRealmDataAccess<Want>, WantRealmViewModelDataAccessProtocol {
    func findAllWants() -> [WantViewModel] {
        return findAllWantsAsViewModel()
    }
    
    private func findAllWantsAsViewModel() -> [WantViewModel] {
        var wantViewModels = [WantViewModel]()
        let wants: [Want] = findAll()
        for want in wants {
            wantViewModels.append(prepareWantViewModel(want: want))
        }
        return wantViewModels
    }
    
    func findSortedWants(sortType: WantSortType, sortOrder: WantSortOrder) -> [WantViewModel] {
        if sortType == WantSortType.BY_AGE && sortOrder == WantSortOrder.ASCENDING {
            return findAllWants().sorted(by: {$0.getDateCreated() < $1.getDateCreated()})
        }
        else if sortType == WantSortType.BY_AGE && sortOrder == WantSortOrder.DESCENDING {
            return findAllWants().sorted(by: {$0.getDateCreated() > $1.getDateCreated()})
        }
        else if sortType == WantSortType.BY_INTEREST_POINTS && sortOrder == WantSortOrder.ASCENDING {
            return findAllWants().sorted(by: {$0.getPoints() < $1.getPoints()})
        }
        else if sortType == WantSortType.BY_INTEREST_POINTS && sortOrder == WantSortOrder.DESCENDING {
            return findAllWants().sorted(by: {$0.getPoints() > $1.getPoints()})
        }
        else {
            return findAllWants()
        }
    }
    
    func findWantsFilteredByName(wantName: String) -> [WantViewModel] {
        return findAllWants().filter({(wantData: WantViewModel) -> Bool in
            return wantData.getName().range(of: wantName, options: .caseInsensitive) != nil
        })
    }
    
    private func prepareWantViewModel(want: Want) -> WantViewModel {
        /*
        let wantViewModelBuilder = WantViewModelBuilder()
        let wantViewModel = wantViewModelBuilder.withId(id: want.getId())
            .withOwner(owner: want.getOwner())
            .withName(name: want.getName())
            .withNotes(notes: want.getNotes())
            .withPoints(points: want.getPoints())
            .withDateCreated(dateCreated: want.getDateCreated())
            .withDaysLeft(daysLeft: want.getDaysLeft())
            .withObtained(obtained: want.isObtained())
            //.withObtainedDate(obtainedDate: want.getObtainedDate()!)
            .withDateModified(dateModified: want.getDateModified())
            .build()
        if want.getObtainedDate() != nil {
            wantViewModel.setObtainedDate(obtainedDate: want.getObtainedDate()!)
        }
        if want.getNotification() != nil {
            let wantNotif = want.getNotification()
            let wantNotifViewModel = WantNotificationViewModel(daysLeft: (wantNotif?.getDaysLeft())!, repeating: (wantNotif?.isRepeating())!, notifying: (wantNotif?.isNotifying())!)
            wantViewModel.setNotificationViewModel(notificationViewModel: wantNotifViewModel)
        }*/
        let wantViewModel = WantModelConverter.convertToViewModel(want: want)
        let validImageName = want.getImageName().components(separatedBy: ".")[0]
        if UUID(uuidString: validImageName) != nil {
            let imagePath = getDocumentDirectoryPath().appendingPathComponent(want.getImageName())
            wantViewModel.setImage(image: UIImage(contentsOfFile: imagePath.path)!)
        }
        return wantViewModel
    }
    
    func deleteAsViewModel(viewModel: WantViewModel) {
        //delete(object: convertWantViewModelToModel(viewModel: viewModel))
        let realm = getRealmInstanceForSubclasses()
        //let wants = realm.objects(Want.self).filter("id = %@", viewModel.getId())
        /*if let want = wants.first {
            try! realm.write {
                want.daysLeft = daysLeft
            }
        }*/
        WantNotificationsManager.removeNotificationByWantId(wantId: viewModel.getId())
        try! realm.write {
            realm.delete(realm.objects(Want.self).filter("id = %@", viewModel.getId()))
        }
    }
    
    private func convertWantViewModelToModel(viewModel: WantViewModel) -> Want {
        let wantBuilder = WantBuilder()
        let wantModel = wantBuilder.withId(id: viewModel.getId())
            .withName(name: viewModel.getName())
            .withPoints(points: Int(viewModel.getPoints())!)
            .withDateCreated(dateCreated: viewModel.getDateCreated())
            .withDateModified(dateModified: viewModel.getDateModified())
            .withDaysLeft(daysLeft: viewModel.getDaysLeft())
            .withNotes(notes: viewModel.getNotes())
            .withObtained(obtained: viewModel.isObtained())
            .build()
        if viewModel.getObtainedDate() != nil {
            wantModel.setObtainedDate(obtainedDate: viewModel.getObtainedDate()!)
        }
        if viewModel.getNotificationViewModel() != nil {
            let wantNotif: WantNotification = createWantNotificationFromViewModel(notifViewModel: viewModel.getNotificationViewModel()!)
            wantModel.setNotification(notification: wantNotif)
        }
        if viewModel.getImage().size.width > 0 {
            let imageName = UUID.init().uuidString + ".jpg"
            saveWantImageToAppDirectory(image: viewModel.getImage(), imageName: imageName)
            wantModel.setImageName(imageName: imageName)
        }
        return wantModel
    }
    
    private func createWantNotificationFromViewModel(notifViewModel: WantNotificationViewModel) -> WantNotification {
        let wantNotifBuilder = WantNotificationBuilder()
        return wantNotifBuilder
            .withDaysLeft(daysLeft: notifViewModel.getDaysLeft())
            .withRepeating(repeating: notifViewModel.isRepeating())
            .withNotifying(notifying: notifViewModel.isNotifying())
            .build()
    }
    
    private func getDocumentDirectoryPath() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func saveAsViewModel(viewModel: WantViewModel) {
        let want = convertWantViewModelToModel(viewModel: viewModel)
        //handleWantNotifications(want: want)
        let wantNotif = want.getNotification()!
        if wantNotif.isNotifying() {
            WantNotificationsManager.scheduleNotificationFromWant(want: want)
        }
        save(object: want)
    }
    
    /*
    private func handleWantNotifications(want: Want) {
        let wantNotif = want.getNotification()!
        if wantNotif.isNotifying() {
            WantNotificationsManager.scheduleNotificationFromWant(want: want)
        } else {
            WantNotificationsManager.removeNotificationByWant(want: want)
        }
    }*/
    
    private func saveWantImageToAppDirectory(image: UIImage, imageName: String) {
        // get the documents directory url
        let documentsDirectory = getDocumentDirectoryPath()
        // create the destination file url to save your image
        let fileURL = documentsDirectory.appendingPathComponent(imageName)
        print("FILE URL: " + fileURL.path)
        // get your UIImage jpeg data representation and check if the destination file url already exists
        /*
        let didExist = FileManager.default.fileExists(atPath: fileURL.path)
        if let data = image.jpegData(compressionQuality:  1.0),
          !didExist {
            do {
                // writes the image data to disk
                try data.write(to: fileURL)
                print("file saved")
            } catch {
                print("error saving file:", error)
            }
        }*/
        
        if !FileManager.default.fileExists(atPath: fileURL.path) {
            let data = image.jpegData(compressionQuality:  1.0)
            do {
                // writes the image data to disk
                try data!.write(to: fileURL)
                print("file saved")
            } catch {
                print("error saving file:", error)
            }
        }
    }
    
    private func removeFileFromDocumentDirectory(fileName: String) {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        do {
            try FileManager.default.removeItem(atPath: fileURL.path)
        } catch let error as NSError {
            print("REMOVING image dont exist")
          print(error.debugDescription)
        }
    }
    
    func updateDaysLeftAsViewModel(viewModel: WantViewModel, daysLeft: Int) {
        let realm = getRealmInstanceForSubclasses()
        let wants = realm.objects(Want.self).filter("id = %@", viewModel.getId())
        if let want = wants.first {
            try! realm.write {
                want.daysLeft = daysLeft
            }
        }
    }
    
    func updateNotesAsViewModel(viewModel: WantViewModel) {
        let realm = getRealmInstanceForSubclasses()
        let wants = realm.objects(Want.self).filter("id = %@", viewModel.getId())
        if let want = wants.first {
            try! realm.write {
                want.notes = viewModel.getNotes()
                want.dateModified = Date()
            }
        }
    }
    
    func updateObtainedAsViewModel(viewModel: WantViewModel) {
        let realm = getRealmInstanceForSubclasses()
        let wants = realm.objects(Want.self).filter("id = %@", viewModel.getId())
        if let want = wants.first {
            try! realm.write {
                if viewModel.isObtained() {
                    want.obtained = viewModel.isObtained()
                    want.obtainedDate = Date()
                }
                else {
                    want.obtained = viewModel.isObtained()
                    want.obtainedDate = nil
                }
            }
        }
    }
    
    func updateImageAsViewModel(viewModel: WantViewModel) {
        let realm = getRealmInstanceForSubclasses()
        let wants = realm.objects(Want.self).filter("id = %@", viewModel.getId())
        if let want = wants.first {
            //TimerProcess.sharedTimer.stopTimer()
            removeFileFromDocumentDirectory(fileName: want.getImageName())
            let imageName = UUID.init().uuidString + ".jpg"
            saveWantImageToAppDirectory(image: viewModel.getImage(), imageName: imageName)
            try! realm.write {
                want.imageName = imageName
                want.dateModified = Date()
            }
        }
    }
    
    // NOTES: KEEP THIS UPDATER
    func updateViewModel(viewModel: WantViewModel) {
        let realm = getRealmInstanceForSubclasses()
        let wants = realm.objects(Want.self).filter("id = %@", viewModel.getId())
        if let want = wants.first {
            try! realm.write {
                want.name = viewModel.getName()
                want.points = Int(viewModel.getPoints())!
                want.dateModified = Date()
                if viewModel.getNotificationViewModel() != nil {
                    let wantNotif: WantNotification = createWantNotificationFromViewModel(notifViewModel: viewModel.getNotificationViewModel()!)
                    want.notification = wantNotif
                }
            }
            //handleWantNotifications(want: want)
        }
    }
    
    func updateViewModelNotifications(viewModel: WantViewModel, shouldUpdate: Bool) {
        if shouldUpdate {
            handleRealmWantNotificationUpdate(viewModel: viewModel)
        }
    }
    
    private func handleRealmWantNotificationUpdate(viewModel: WantViewModel) {
        let realm = getRealmInstanceForSubclasses()
        let wants = realm.objects(Want.self).filter("id = %@", viewModel.getId())
        if let want = wants.first  {
            try! realm.write {
                if viewModel.getNotificationViewModel() != nil {
                    let wantNotif: WantNotification = createWantNotificationFromViewModel(notifViewModel: viewModel.getNotificationViewModel()!)
                    want.notification = wantNotif
                }
            }
            handleWantNotificationsUpdate(want: want)
        }
    }
    
    private func handleWantNotificationsUpdate(want: Want) {
        let wantNotif = want.getNotification()!
        if wantNotif.isNotifying() {
            // Remove request from Notification Center then add a new one from the same Want
            WantNotificationsManager.removeNotificationByWantId(wantId: want.getId())
            WantNotificationsManager.scheduleNotificationFromWant(want: want)
        } else {
            WantNotificationsManager.removeNotificationByWantId(wantId: want.getId())
        }
    }
}
