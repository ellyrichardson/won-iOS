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
            let wantViewModelBuilder = WantViewModelBuilder()
            let wantViewModel = wantViewModelBuilder.withId(id: want.getId())
                .withOwner(owner: want.getOwner())
                .withName(name: want.getName())
                .withNotes(notes: want.getNotes())
                .withPoints(points: want.getPoints())
                .withDateCreated(dateCreated: want.getDateCreated())
                .withDaysLeft(daysLeft: want.getDaysLeft())
                .withDateModified(dateModified: want.getDateModified())
                .build()
            wantViewModels.append(wantViewModel)
        }
        return wantViewModels
    }
    
    public func deleteAsViewModel(viewModel: WantViewModel) {
        delete(object: convertWantViewModelToModel(viewModel: viewModel))
    }
    
    private func convertWantViewModelToModel(viewModel: WantViewModel) -> Want {
        let wantBuilder = WantBuilder()
        let wantModel = wantBuilder.withId(id: viewModel.getId())
            .withName(name: viewModel.getName())
            .withPoints(points: Int(viewModel.getPoints())!)
            .withDateCreated(dateCreated: viewModel.getDateCreated())
            .withDateModified(dateModified: viewModel.getDateModified())
            .withDaysLeft(daysLeft: viewModel.getDaysLeft())
            .build()
        if viewModel.getImage().size.width > 0 {
            let imageName = UUID.init().uuidString
            saveWantImageToAppDirectory(image: viewModel.getImage(), imageName: imageName)
            wantModel.setImagePath(imagePath: "THEPATH/" + imageName)
        }
        return wantModel
    }
    
    public func saveAsViewModel(viewModel: WantViewModel) {
        save(object: convertWantViewModelToModel(viewModel: viewModel))
    }
    
    private func saveWantImageToAppDirectory(image: UIImage, imageName: String) {
        // get the documents directory url
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        // choose a name for your image
        let fileName = imageName
        // create the destination file url to save your image
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        // get your UIImage jpeg data representation and check if the destination file url already exists
        if let data = image.jpegData(compressionQuality:  1.0),
          !FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                // writes the image data to disk
                try data.write(to: fileURL)
                print("file saved")
            } catch {
                print("error saving file:", error)
            }
        }
    }
    
    public func updateDaysLeftAsViewModel(viewModel: WantViewModel, daysLeft: Int) {
        let realm = getRealmInstanceForSubclasses()
        let wants = realm.objects(Want.self).filter("id = %@", viewModel.getId())
        if let want = wants.first {
            try! realm.write {
                want.daysLeft = daysLeft
            }
        }
    }
}
