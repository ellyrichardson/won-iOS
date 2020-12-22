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
            wantViewModels.append(WantViewModel(id: want.getId(), owner: want.getOwner(), name: want.getName(), points: want.getPoints(), notes: want.getNotes()))
        }
        return wantViewModels
    }
    
    public func deleteWantAsViewModel(viewModel: WantViewModel) {
        deleteObject(object: convertWantViewModelToModel(viewModel: viewModel))
    }
    
    private func convertWantViewModelToModel(viewModel: WantViewModel) -> Want {
        let wantBuilder = WantBuilder()
        return wantBuilder.withId(id: viewModel.getId()).withName(name: viewModel.getName()).withPoints(points: Int(viewModel.getPoints())!).build()
    }
    
    public func saveWantAsViewModel(viewModel: WantViewModel) {
        saveObject(object: convertWantViewModelToModel(viewModel: viewModel))
    }
}
