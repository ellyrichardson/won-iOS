//
//  WantRealmSource.swift
//  won-iOS
//
//  Created by Elly Richardson on 12/4/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

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
                .withDateModified(dateModified: want.getDateModified())
                .build()
            wantViewModels.append(wantViewModel)
        }
        return wantViewModels
    }
    
    public func deleteWantAsViewModel(viewModel: WantViewModel) {
        deleteObject(object: convertWantViewModelToModel(viewModel: viewModel))
    }
    
    private func convertWantViewModelToModel(viewModel: WantViewModel) -> Want {
        let wantBuilder = WantBuilder()
        return wantBuilder.withId(id: viewModel.getId())
            .withName(name: viewModel.getName())
            .withPoints(points: Int(viewModel.getPoints())!)
            .withDateCreated(dateCreated: viewModel.getDateCreated())
            .withDateModified(dateModified: viewModel.getDateModified())
            .build()
    }
    
    public func saveWantAsViewModel(viewModel: WantViewModel) {
        saveObject(object: convertWantViewModelToModel(viewModel: viewModel))
    }
}
